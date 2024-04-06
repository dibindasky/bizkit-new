import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/data/features/pdf/pdf_picker.dart';
import 'package:bizkit/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/domain/model/card/card/accredition/accredition.dart';
import 'package:bizkit/domain/model/card/card/bank_details/bank_details.dart';
import 'package:bizkit/domain/model/card/card/brochure/brochure.dart';
import 'package:bizkit/domain/model/card/card/business_detail/business_details.dart';
import 'package:bizkit/domain/model/card/card/card/card.dart';
import 'package:bizkit/domain/model/card/card/logo_card/logo_card.dart';
import 'package:bizkit/domain/model/card/card/product/product.dart';
import 'package:bizkit/domain/model/card/card/social_media/social_media_handle.dart';
import 'package:bizkit/domain/model/card/create_card/branch_offices/branch_offices.dart';
import 'package:bizkit/domain/model/card/create_card/business_detail/business_details.dart';
import 'package:bizkit/domain/model/card/create_card/company/get_companys/company.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:bizkit/domain/model/search_query/search_query.dart';
import 'package:bizkit/domain/repository/service/card_patch_repo.dart';
import 'package:bizkit/domain/repository/service/card_repo.dart';
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'business_data_event.dart';
part 'business_data_state.dart';
part 'business_data_bloc.freezed.dart';

@injectable
class BusinessDataBloc extends Bloc<BusinessDataEvent, BusinessDataState> {
  final mat.TextEditingController businessNameController =
      mat.TextEditingController();
  final mat.TextEditingController companyController =
      mat.TextEditingController();
  final mat.TextEditingController mailController = mat.TextEditingController();
  final mat.TextEditingController mobileController =
      mat.TextEditingController();
  final mat.TextEditingController addressController =
      mat.TextEditingController();
  final mat.TextEditingController websiteLinkController =
      mat.TextEditingController(text: 'https://');
  final mat.TextEditingController logoStoryController =
      mat.TextEditingController();
  final mat.TextEditingController nameOfCompanyController =
      mat.TextEditingController();
  final mat.TextEditingController upiDetailController =
      mat.TextEditingController();
  final mat.TextEditingController accountNumberController =
      mat.TextEditingController();
  final mat.TextEditingController ifscController = mat.TextEditingController();
  final mat.TextEditingController gstNumberController =
      mat.TextEditingController();
  final mat.TextEditingController branchOfficeController =
      mat.TextEditingController();

  final PdfPickerImpl pdfPicker;
  final CardRepo cardService;
  final UserLocalRepo userLocalService;
  final CardPatchRepo cardPatchRepo;

  BusinessDataBloc(this.pdfPicker, this.cardService, this.userLocalService,
      this.cardPatchRepo)
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
    on<GetCurrentCard>(getCurrentCard);
    on<UploadLogo>(uploadLogo);
    on<Clear>(clear);
  }

  FutureOr<void> getCurrentCard(GetCurrentCard event, emit) async {
    emit(
      state.copyWith(
          businessAdded: false,
          bankingAdded: false,
          logoAdded: false,
          currentCard: event.card,
          accreditions: event.card.accreditation ?? <Accredition>[],
          socialMedias: event.card.businessSocialMedia ?? <SocialMediaHandle>[],
          logoCard: event.card.logoCard ?? LogoCard(),
          products: event.card.product ?? [],
          brochures: event.card.brochure ?? []),
    );
    businessNameController.text =
        event.card.businessDetails?.businessName ?? '';
    companyController.text = event.card.businessDetails?.company ?? '';
    mailController.text = event.card.businessDetails?.email ?? '';
    mobileController.text = event.card.businessDetails?.mobileNumber ?? '';
    websiteLinkController.text = event.card.businessDetails?.websiteLink ?? '';
    addressController.text = event.card.businessDetails?.address ?? '';
    logoStoryController.text = event.card.logoCard?.logoStory ?? '';
    accountNumberController.text = event.card.bankDetails?.accountNumber ?? '';
    ifscController.text = event.card.bankDetails?.ifscCode ?? '';
    nameOfCompanyController.text = event.card.bankDetails?.nameOfCompany ?? '';
    gstNumberController.text =
        event.card.bankDetails?.gstMembershipDetails ?? '';
    upiDetailController.text = event.card.bankDetails?.upiDetails ?? '';
    print('business name = >   ${event.card.businessDetails?.businessName}');
  }

  FutureOr<void> createBankingData(CreateBankingData event, emit) async {
    if (state.bankDetailsCreateId != null) return;
    emit(state.copyWith(
        bankingLoading: true,
        hasError: false,
        bankingAdded: false,
        message: null,
        gotCompanyData: false));
    final BankDetails bankDetails = BankDetails(
        cardId: state.currentCard!.id!,
        nameOfCompany: nameOfCompanyController.text.trim().isEmpty
            ? null
            : nameOfCompanyController.text,
        accountNumber: accountNumberController.text.trim().isEmpty
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
    emit(state.copyWith(bankDetails: bankDetails));
    final result =
        await cardPatchRepo.postBankingDetails(bankDetails: bankDetails);
    result.fold(
        (l) => emit(state.copyWith(
            bankingLoading: false,
            isLoading: false,
            hasError: true,
            message: l.message,
            gotCompanyData: false)),
        (r) => emit(state.copyWith(
            isLoading: false,
            gotCompanyData: false,
            bankDetails: r,
            bankingLoading: false,
            bankingAdded: true)));
  }

  FutureOr<void> createBusinessData(CreateBusinessData event, emit) async {
    emit(state.copyWith(
        businessLoading: true,
        businessAdded: false,
        hasError: false,
        message: null,
        gotCompanyData: false));
    final BusinessDetails businessDetails = BusinessDetails(
      address:
          addressController.text.trim().isEmpty ? null : addressController.text,
      businessName: businessNameController.text.trim().isEmpty
          ? null
          : businessNameController.text,
      company:
          companyController.text.trim().isEmpty ? null : companyController.text,
      websiteLink: websiteLinkController.text.trim().isEmpty
          ? null
          : websiteLinkController.text,
      email: mailController.text.trim().isNotEmpty ? mailController.text : null,
      mobileNumber: mobileController.text.trim().isNotEmpty
          ? mobileController.text
          : null,
    );
    final result = await cardService.createBusinessDataCard(
        businessDetails: businessDetails, id: state.currentCard!.id!);
    result.fold(
        (l) => emit(state.copyWith(
            businessLoading: false,
            businessAdded: false,
            gotCompanyData: false)),
        (r) => emit(state.copyWith(
            businessLoading: false,
            businessAdded: true,
            businessDetails: businessDetails,
            gotCompanyData: false)));
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
      print(
          '====================================***********************************************************=====================================');
      print('got company detaisa');
      emit(state.copyWith(
          // businessDetailsCreateId: event.id,
          businessData: business,
          gotCompanyData: true,
          loadCompanyData: false,
          message: 'selected company data added to your profile'));
      businessNameController.text = business.businessName ?? '';
      mailController.text = business.email ?? '';
      mobileController.text = business.mobileNumber ?? '';
      addressController.text = business.address ?? '';
      websiteLinkController.text = business.websiteLink ?? '';
      logoStoryController.text = business.logoStory ?? '';
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
    final business = await SecureStorage.getRole();
    result.fold((l) => null, (userData) {
      websiteLinkController.text =
          userData.first.websiteLink ?? websiteLinkController.text;
      emit(state.copyWith(isBusiness: business, gotCompanyData: false));
    });
  }

  FutureOr<void> addLogo(AddLogo event, emit) async {
    final image = await ImagePickerClass.getImage(camera: false);
    if (image != null) {
      LogoCard logoCard = state.logoCard!.copyWith(logo: image.base64);
      emit(state.copyWith(
          logo: image, gotCompanyData: false, logoCard: logoCard));
    }
  }

  FutureOr<void> uploadLogo(UploadLogo event, emit) async {
    emit(state.copyWith(logoAdded: false, logoLoading: true, message: null));
    LogoCard logoCard = state.logoCard!.copyWith(
        logoStory: logoStoryController.text.trim(),
        cardId: state.currentCard!.id!);
    final result = await cardPatchRepo.addLogo(logoCard: logoCard);
    result.fold(
        (l) => emit(state.copyWith(
            logoAdded: false, logoLoading: false, message: null)),
        (r) => emit(state.copyWith(
            logoAdded: true, logoLoading: false, message: null, logoCard: r)));
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
    // final result = await pdfPicker.pickPDF();
    // result.fold((l) {
    //   return;
    // }, (pdf) {
    //   final List<BrochureCreate> list = List.from(state.brochures);
    //   list.add(BrochureCreate(file: pdf));
    //   emit(state.copyWith(brochures: list, gotCompanyData: false));
    // });
  }

  FutureOr<void> removeBrochure(RemoveBrochure event, emit) async {
    // final List<BrochureCreate> list = [];
    // for (BrochureCreate brochure in state.brochures) {
    //   if (state.brochures[event.index] != brochure) {
    //     list.add(brochure);
    //   }
    // }
    // emit(state.copyWith(brochures: list, gotCompanyData: false));
  }

  FutureOr<void> addBranch(AddBranch event, emit) async {
    // final List<BranchOffices> list = List.from(state.branchOffices);
    // list.add(BranchOffices(branch: event.branch));
    // emit(state.copyWith(branchOffices: list, gotCompanyData: false));
  }

  FutureOr<void> removeBranch(RemoveBranch event, emit) async {}

  FutureOr<void> addProduct(AddProduct event, emit) async {
    // final List<ProductCreate> list = List.from(state.products);
    // list.add(event.product);
    // emit(state.copyWith(products: list, gotCompanyData: false));
  }

  FutureOr<void> removeProduct(RemoveProduct event, emit) async {
    // final List<ProductCreate> list = [];
    // for (ProductCreate product in state.products) {
    //   if (state.products[event.index] != product) {
    //     list.add(product);
    //   }
    // }
    // emit(state.copyWith(products: list, gotCompanyData: false));
  }

  FutureOr<void> addAccredition(AddAccredition event, emit) async {
    // final List<AccreditionCreate> list = List.from(state.accreditions);
    // list.add(event.accredition);
    // emit(state.copyWith(accreditions: list, gotCompanyData: false));
  }

  FutureOr<void> removeAccredition(RemoveAccredition event, emit) async {
    // final List<AccreditionCreate> list = [];
    // for (AccreditionCreate accredition in state.accreditions) {
    //   if (state.accreditions[event.index] != accredition) {
    //     list.add(accredition);
    //   }
    // }
    // emit(state.copyWith(accreditions: list, gotCompanyData: false));
  }

  FutureOr<void> addSocialMedia(AddSocialMedia event, emit) async {
        emit(state.copyWith(message: null, socialMediaLoading: true));
    final result = await cardPatchRepo.addSocialMedia(
        socialMediaHandle: event.socialMediaHandle);
    result.fold((l) => emit(state.copyWith(socialMediaLoading: false)), (r) {
      return (state.copyWith(
          socialMediaLoading: false, socialMedias: [...state.socialMedias, r]));
    });
  }

  FutureOr<void> removeSocialMedia(RemoveSocialMedia event, emit) async {
    emit(state.copyWith( message: null, socialMediaDeleteLoading: true));
    final result = await cardPatchRepo.deleteSocialMedia(id: event.id);
    result.fold((l) => emit(state.copyWith(socialMediaDeleteLoading: false)),
        (r) {
      List<SocialMediaHandle> list = List.from(state.socialMedias);
      list.removeWhere((element) => element.id == event.id);
      return (state.copyWith(
          socialMediaDeleteLoading: false, socialMedias: list));
    });
  }
}
