import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/data/features/pdf/pdf_picker.dart';
import 'package:bizkit/domain/model/card/card/business_detail/business_details.dart';
import 'package:bizkit/domain/model/card/create_card/accridition/accredition.dart';
import 'package:bizkit/domain/model/card/create_card/banking_detail/bank_details.dart';
import 'package:bizkit/domain/model/card/create_card/branch_offices/branch_offices.dart';
import 'package:bizkit/domain/model/card/create_card/brochure/brochure.dart';
import 'package:bizkit/domain/model/card/create_card/business_detail/business_details.dart';
import 'package:bizkit/domain/model/card/create_card/company/get_companys/company.dart';
import 'package:bizkit/domain/model/card/create_card/product/product.dart';
import 'package:bizkit/domain/model/card/create_card/social_media_handle/social_media_handle.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:bizkit/domain/model/search_query/search_query.dart';
import 'package:bizkit/domain/repository/service/card_repo.dart';
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'business_data_event.dart';
part 'business_data_state.dart';
part 'business_data_bloc.freezed.dart';

@injectable
class BusinessDataBloc extends Bloc<BusinessDataEvent, BusinessDataState> {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController websiteLinkController = TextEditingController();
  final TextEditingController logoStoryController = TextEditingController();
  final TextEditingController nameOfCompanyController = TextEditingController();
  final TextEditingController upiDetailController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController gstNumberController = TextEditingController();
  final TextEditingController branchOfficeController = TextEditingController();

  final PdfPickerImpl pdfPicker;
  final CardRepo cardService;
  final UserLocalRepo userLocalService;

  BusinessDataBloc(this.pdfPicker, this.cardService, this.userLocalService)
      : super(BusinessDataState.initial()) {
    on<AddAccredition>(addAccredition);
    on<RemoveAccredition>(removeAccredition);
    on<AddSocialMedia>(addSocialMedia);
    on<RemoveSocialMedia>(removeSocialMedia);
    on<AddLogo>(addLogo);
    on<AddCropedLogo>(addCropedLogo);
    on<AddBrochures>(addBrochure);
    on<RemoveBrochure>(removeBrochure);
    on<AddProduct>(addProduct);
    on<RemoveProduct>(removeProduct);
    on<AddBranch>(addBranch);
    on<RemoveBranch>(removeBranch);
    on<CreateBusinessData>(createBusinessData);
    on<CreateBankingData>(createBankingData);
    on<GetCompnayList>(getCompnayList);
    on<GetCompnayDetails>(getCompnayDetails);
    on<GetUserData>(getUserData);
    on<Clear>(clear);
  }

  FutureOr<void> createBankingData(CreateBankingData event, emit) async {
    if (state.bankDetailsCreateId != null) return;
    emit(state.copyWith(
        isLoading: true,
        hasError: false,
        message: null,
        gotCompanyData: false));
    final BankDetailsCreate bankDetails = BankDetailsCreate(
        nameOfCompany: nameOfCompanyController.text.trim().isEmpty
            ? null
            : nameOfCompanyController.text,
        acccountNumber: accountNumberController.text.trim().isEmpty
            ? null
            : accountNumberController.text,
        ifscCode:
            ifscController.text.trim().isEmpty ? null : ifscController.text,
        upiDetails: upiDetailController.text.trim().isEmpty
            ? null
            : upiDetailController.text,
        gstMembershipDetails: gstNumberController.text.trim().isEmpty
            ? null
            : gstNumberController.text);
    emit(state.copyWith(
        bankDetails: bankDetails,
        businessDetails:
            state.businessDetails.copyWith(bankDetails: bankDetails)));
    final result = await cardService.createBusinessDataCard(
        businessDetailsCreate: state.businessDetails);
    print('got data back createBusinessDataCard');
    result.fold(
        (l) => emit(state.copyWith(
            isLoading: false,
            hasError: true,
            message: l.message,
            gotCompanyData: false)),
        (success) => emit(state.copyWith(
            isLoading: false,
            businessData: success,
            gotCompanyData: false)));
  }

  FutureOr<void> createBusinessData(CreateBusinessData event, emit) async {
    emit(state.copyWith(
        isLoading: true,
        hasError: false,
        message: null,
        gotCompanyData: false));
    final BusinessDetailsCreate businessDetails = BusinessDetailsCreate(
      accredition: state.accreditions.isEmpty
          ? []
          : state.accreditions
              .map((e) => AccreditionCreate(
                  description: e.description,
                  label: e.label,
                  image: e.image.base64))
              .toList(),
      branchOffices: state.branchOffices,
      address:
          addressController.text.trim().isEmpty ? null : addressController.text,
      businessName: businessNameController.text.trim().isEmpty
          ? null
          : businessNameController.text,
      company:
          companyController.text.trim().isEmpty ? null : companyController.text,
      logoStory: logoStoryController.text.trim().isEmpty
          ? null
          : logoStoryController.text,
      websiteLink: websiteLinkController.text.trim().isEmpty
          ? null
          : websiteLinkController.text,
      email: mailController.text.trim().isNotEmpty ? mailController.text : null,
      mobileNumber: mobileController.text.trim().isNotEmpty
          ? mobileController.text
          : null,
      logo: state.logo?.base64,
      socialMediaHandles: state.socialMedias,
      product: state.products.isEmpty
          ? []
          : state.products
              .map((e) => ProductCreate(
                  enquiry: e.enquiry,
                  label: e.label,
                  description: e.description,
                  product: e.product.base64))
              .toList(),
      brochure: state.brochures.isEmpty
          ? []
          : state.brochures
              .map((e) => BrochureCreate(file: e.file.base64))
              .toList(),
    );
    emit(state.copyWith(
        isLoading: false,
        businessDetails: businessDetails,
        gotCompanyData: false));
  }

  FutureOr<void> getCompnayList(GetCompnayList event, emit) async {
    final result = await cardService.getCompanies(search: event.search);
    result.fold(
        (l) => null,
        (getCompanysResponseModel) => emit(state.copyWith(
            gotCompanyData: false,
            companiesList:
                getCompanysResponseModel.companies ?? state.companiesList)));
  }

  FutureOr<void> getCompnayDetails(GetCompnayDetails event, emit) async {
    emit(state.copyWith(
        loadCompanyData: true,
        message: null,
        hasError: false,
        gotCompanyData: false));
    final result = await cardService.getCompnayDetails(id: event.id);
    result.fold(
        (failure) => emit(state.copyWith(
            loadCompanyData: false,
            hasError: true,
            gotCompanyData: false,
            message: 'failed to add company data to profile')), (business) {
      emit(state.copyWith(
          // businessDetailsCreateId: event.id,
          businessData:business,
          gotCompanyData: true,
          loadCompanyData: false,
          message: 'selected company data added to your profile'));
      businessNameController.text = business.businessName ?? '';
      // companyController.text = business.company ?? '';
      mailController.text = business.email ?? '';
      mobileController.text = business.mobileNumber ?? '';
      addressController.text = business.address ?? '';
      websiteLinkController.text = business.websiteLink ?? '';
      logoStoryController.text = business.logoStory ?? '';
      nameOfCompanyController.text = business.bankDetails?.nameOfCompany ?? '';
      upiDetailController.text = business.bankDetails?.upiDetails ?? '';
      accountNumberController.text = business.bankDetails?.accountNumber ?? '';
      ifscController.text = business.bankDetails?.ifscCode ?? '';
      gstNumberController.text =
          business.bankDetails?.gstMembershipDetails ?? '';

      // emit(state.copyWith(
      //     accreditions: business.accredition
      //             ?.map((e) => AccreditionCreate(
      //                 image: e.image,
      //                 description: e.description,
      //                 label: e.label))
      //             .toList() ??
      //         <AccreditionCreate>[],
      //     socialMedias: business.socialMediaHandles
      //             ?.map((e) => SocialMediaHandleCreate(
      //                 label: e.label, socialMedia: e.socialMedia))
      //             .toList() ??
      //         <SocialMediaHandleCreate>[],

      //         ));
    });
  }

  // need to implement clear fields after card creation
  FutureOr<void> clear(Clear event, emit) async {
    businessNameController.clear();
    companyController.clear();
    mailController.clear();
    mobileController.clear();
    addressController.clear();
    websiteLinkController.clear();
    logoStoryController.clear();
    nameOfCompanyController.clear();
    upiDetailController.clear();
    ifscController.clear();
    gstNumberController.clear();
    branchOfficeController.clear();
    accountNumberController.clear();
    emit(BusinessDataState.initial());
  }

  FutureOr<void> getUserData(GetUserData event, emit) async {
    final result = await userLocalService.getUserData();
    result.fold((l) => null, (userData) {
      websiteLinkController.text =
          userData.first.websiteLink ?? websiteLinkController.text;
      emit(state.copyWith(
          isBusiness: userData.first.isBusiness!, gotCompanyData: false));
    });
  }

  FutureOr<void> addLogo(AddLogo event, emit) async {
    final image = await ImagePickerClass.getImage(camera: false);
    if (image != null) {
      emit(state.copyWith(logo: image, gotCompanyData: false));
    }
  }

  FutureOr<void> addCropedLogo(
      AddCropedLogo event, Emitter<BusinessDataState> emit) async {
    print('in logo adding base64');
    final decodedBytes = base64Decode(event.base64);
    final tempDir = Directory.systemTemp;
    final file =
        File('${tempDir.path}/${DateTime.now().microsecondsSinceEpoch}');
    if (decodedBytes.isNotEmpty) {
      await file.writeAsBytes(decodedBytes);
    }
    emit(state.copyWith(
        logo: ImageModel(fileImage: file, base64: event.base64),
        gotCompanyData: false));
  }

  FutureOr<void> addBrochure(AddBrochures event, emit) async {
    final result = await pdfPicker.pickPDF();
    result.fold((l) {
      return;
    }, (pdf) {
      final List<BrochureCreate> list = List.from(state.brochures);
      list.add(BrochureCreate(file: pdf));
      emit(state.copyWith(brochures: list, gotCompanyData: false));
    });
  }

  FutureOr<void> removeBrochure(RemoveBrochure event, emit) async {
    final List<BrochureCreate> list = [];
    for (BrochureCreate brochure in state.brochures) {
      if (state.brochures[event.index] != brochure) {
        list.add(brochure);
      }
    }
    emit(state.copyWith(brochures: list, gotCompanyData: false));
  }

  FutureOr<void> addBranch(AddBranch event, emit) async {
    final List<BranchOffices> list = List.from(state.branchOffices);
    list.add(BranchOffices(branch: event.branch));
    emit(state.copyWith(branchOffices: list, gotCompanyData: false));
  }

  FutureOr<void> removeBranch(RemoveBranch event, emit) async {
    final List<BranchOffices> list = [];
    for (BranchOffices branch in state.branchOffices) {
      if (state.branchOffices[event.index].branch != branch.branch) {
        list.add(branch);
      }
    }
    emit(state.copyWith(branchOffices: list, gotCompanyData: false));
  }

  FutureOr<void> addProduct(AddProduct event, emit) async {
    final List<ProductCreate> list = List.from(state.products);
    list.add(event.product);
    emit(state.copyWith(products: list, gotCompanyData: false));
  }

  FutureOr<void> removeProduct(RemoveProduct event, emit) async {
    final List<ProductCreate> list = [];
    for (ProductCreate product in state.products) {
      if (state.products[event.index] != product) {
        list.add(product);
      }
    }
    emit(state.copyWith(products: list, gotCompanyData: false));
  }

  FutureOr<void> addAccredition(AddAccredition event, emit) async {
    final List<AccreditionCreate> list = List.from(state.accreditions);
    list.add(event.accredition);
    emit(state.copyWith(accreditions: list, gotCompanyData: false));
  }

  FutureOr<void> removeAccredition(RemoveAccredition event, emit) async {
    final List<AccreditionCreate> list = [];
    for (AccreditionCreate accredition in state.accreditions) {
      if (state.accreditions[event.index] != accredition) {
        list.add(accredition);
      }
    }
    emit(state.copyWith(accreditions: list, gotCompanyData: false));
  }

  FutureOr<void> addSocialMedia(AddSocialMedia event, emit) async {
    final List<SocialMediaHandleCreate> list = List.from(state.socialMedias);
    list.add(event.socialMediaHandle);
    emit(state.copyWith(socialMedias: list, gotCompanyData: false));
  }

  FutureOr<void> removeSocialMedia(RemoveSocialMedia event, emit) async {
    final List<SocialMediaHandleCreate> list = [];
    for (SocialMediaHandleCreate socialMediaHandle in state.socialMedias) {
      if (state.socialMedias[event.index] != socialMediaHandle) {
        list.add(socialMediaHandle);
      }
    }
    emit(state.copyWith(socialMedias: list, gotCompanyData: false));
  }
}
