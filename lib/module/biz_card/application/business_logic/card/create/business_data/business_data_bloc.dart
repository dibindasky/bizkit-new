import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bizkit/core/model/pdf/pdf_model.dart';
import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/module/biz_card/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/accredition/accredition.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/accredition/accredition_image_adding_model/accredition_image_adding_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/bank_details/bank_details.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/branch_office/branch_office.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/brochure/brochure.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/business_detail/business_details.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/card/card.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/image_card/image_card.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/logo_card/logo_card.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/product/product.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/product/product_image_adding_model/product_image_adding_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/product_image_add/image.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/product_image_add/product_image_add.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/social_media/social_media_handle.dart';
import 'package:bizkit/module/biz_card/domain/model/card/company/get_company_response_model/company.dart';
import 'package:bizkit/core/model/image/image_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card_patch_repo.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card_repo.dart';
import 'package:bizkit/module/biz_card/domain/repository/sqflite/user_local_repo.dart';
import 'package:bizkit/packages/pdf/pdf_picker.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
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
  final mat.TextEditingController branchOfficeNameController =
      mat.TextEditingController();
  final mat.TextEditingController branchOfficePhoneController =
      mat.TextEditingController();
  final mat.TextEditingController brochureLabelController =
      mat.TextEditingController();

  final PdfPickerImpl pdfPicker;
  final CardRepo cardService;
  final UserLocalRepo userLocalService;
  final CardPatchRepo cardPatchRepo;
  List<ImageCard> imageList = [];

  BusinessDataBloc(this.pdfPicker, this.cardService, this.userLocalService,
      this.cardPatchRepo)
      : super(BusinessDataState.initial()) {
    on<AddAccredition>(addAccredition);
    on<RemoveAccredition>(removeAccredition);
    on<AccreditationPickImage>(accreditationPickImage);
    on<AddSocialMedia>(addSocialMedia);
    on<RemoveSocialMedia>(removeSocialMedia);
    on<RemoveBusinessSocialMedia>(removeBusinessSocialMedia);
    on<AddLogo>(addLogo);
    on<AddCropedLogo>(addCropedLogo);
    on<AddBrochures>(addBrochures);
    on<AddBrochure>(addBrochure);
    on<UpdateBrochure>(updateBrochure);
    on<RemoveBrochure>(removeBrochure);
    on<AddProduct>(addProduct);
    on<PickProductImage>(pickProductImage);
    on<ProductUpdatePickImage>(productUpdatePickImage);
    on<ProductUpdateImages>(productUpdateImages);
    on<RemoveProductIndexImages>(removeProductIndexImages);
    on<RemoveProductImages>(removeProductImages);
    on<RemoveProduct>(removeProduct);
    on<UpdateProduct>(updateProduct);
    on<AddBranch>(addBranch);
    on<UpdateBranch>(updateBranch);
    on<RemoveBranch>(removeBranch);
    on<CreateBusinessData>(createBusinessData);
    on<CreateBankingData>(createBankingData);
    on<GetCompnayList>(getCompnayList);
    on<GetCompnayDetails>(getCompnayDetails);
    on<RemoveBusinessData>(removeBusinessData);
    on<RemoveAccreditionImage>(removeAccreditionImage);
    on<GetUserData>(getUserData);
    on<GetCurrentCard>(getCurrentCard);
    on<UploadLogo>(uploadLogo);
    on<Clear>(clear);
  }

  FutureOr<void> removeAccreditionImage(
      RemoveAccreditionImage event, emit) async {
    await cardPatchRepo.deleteAccreditationImage(id: event.id);
    emit(state);
  }

  FutureOr<void> accreditationPickImage(
      AccreditationPickImage event, emit) async {
    emit(state.copyWith(
      pickImageLoading: true,
      pickImageError: false,
      productUpdated: false,
    ));
    final pickImage = await ImagePickerClass.getImage(
        camera: event.isCam, cameraDeviceFront: event.isFront);
    ImageCard imageCard = ImageCard();

    if (pickImage != null) {
      imageCard.image = pickImage.base64;
      emit(
        state.copyWith(
          pickImageError: false,
          accreditationPickImages: [
            ...state.accreditationPickImages,
            imageCard,
          ],
          pickImageLoading: false,
        ),
      );
      //add(BusinessDataEvent.productUpdateImages(image: []));
    } else {
      emit(state.copyWith(
        pickImageLoading: false,
        pickImageError: true,
      ));
    }
  }

  FutureOr<void> pickProductImage(PickProductImage event, emit) async {
    emit(state.copyWith(
      pickImageLoading: true,
      pickImageError: false,
      productUpdated: false,
      productAdded: false,
    ));
    final pickImage = await ImagePickerClass.getImage(
        camera: event.isCam, cameraDeviceFront: false);

    if (pickImage != null) {
      emit(
        state.copyWith(
          pickImageError: false,
          productImages: [
            ...state.productImages,
            ImageCard(image: pickImage.base64),
          ],
          pickImageLoading: false,
        ),
      );
    } else {
      emit(state.copyWith(
        pickImageLoading: false,
        pickImageError: true,
      ));
    }
  }

  FutureOr<void> productUpdatePickImage(
      ProductUpdatePickImage event, emit) async {
    log('inside productUpdatePickImage');
    emit(state.copyWith(pickImageLoading: true, pickImageError: false));
    final pickImage = await ImagePickerClass.getImage(
        camera: event.isCam, cameraDeviceFront: event.isFront);
    ImageCard imageCard = ImageCard();
    if (pickImage != null) {
      imageCard.image = pickImage.base64;
      emit(
        state.copyWith(
          pickImageError: false,
          // productUpdateImages: [
          //   ...state.productUpdateImages,
          //   imageCard,
          // ],
          pickImageLoading: false,
        ),
      );
      add(BusinessDataEvent.productUpdateImages(
        productImageAdd: ProductImageAdd(
          productId: event.productId,
          image: [Image(image: pickImage.base64)],
        ),
      ));
    } else {
      emit(state.copyWith(
        pickImageLoading: false,
        pickImageError: true,
      ));
    }
  }

  FutureOr<void> productUpdateImages(ProductUpdateImages event, emit) async {
    log('inside productUpdateImages');
    emit(state.copyWith(
      productImageupdateError: false,
      productimageLoading: true,
      productImageupdated: false,
    ));
    final data = await cardPatchRepo.addProductImage(
        productImageAdd: event.productImageAdd);
    data.fold(
      (l) => emit(state.copyWith(
          productImageupdateError: true,
          productimageLoading: false,
          productImageupdated: false)),
      (r) => emit(state.copyWith(
        productImageupdateError: false,
        productimageLoading: false,
        productImageupdated: true,
        productImages: state.productImages,
      )),
    );
  }

  FutureOr<void> removeProductImages(RemoveProductImages event, emit) async {
    emit(state.copyWith(
      pickImageError: false,
      productDeleteLoading: true,
      hasError: false,
      accreditionAdded: false,
      branchAdded: false,
      brochureAdded: false,
      productAdded: false,
      socialMediaAdded: false,
      businessAdded: false,
      bankingAdded: false,
      logoAdded: false,
    ));
    final data = await cardPatchRepo.removeProductImage(id: event.id);
    data.fold(
        (l) => emit(state.copyWith(
              productDeleteLoading: false,
              hasError: true,
            )), (r) {
      List<ImageCard> images = List.from(state.productImages);
      images.removeWhere((element) => element.id == event.id);
      return emit(state.copyWith(
          productDeleteLoading: false,
          hasError: false,
          products: [...state.products],
          productImages: images));
    });
  }

  FutureOr<void> removeProductIndexImages(
      RemoveProductIndexImages event, emit) {
    cardPatchRepo.removeProductImage(id: event.index);
  }

  FutureOr<void> getCurrentCard(GetCurrentCard event, emit) async {
    final business = await SecureStorage.getRole();
    emit(
      state.copyWith(
          isBusiness: business,
          accreditionAdded: false,
          companyDataRemoved: false,
          branchAdded: false,
          brochureAdded: false,
          productAdded: false,
          socialMediaAdded: false,
          businessAdded: false,
          bankingAdded: false,
          logoAdded: false,
          currentCard: event.card,
          companiesList: [],
          branchOffices: event.card.isCompanyAutofilled == true
              ? <BranchOffice>[]
              : event.card.branchOffices ?? <BranchOffice>[],
          businessData: event.card.isCompanyAutofilled == true
              ? BusinessDetails()
              : event.card.businessDetails ?? BusinessDetails(),
          bankDetails: event.card.isCompanyAutofilled == true
              ? BankDetails()
              : event.card.bankDetails ?? BankDetails(),
          accreditions: event.card.isCompanyAutofilled == true
              ? <Accredition>[]
              : event.card.accreditation ?? <Accredition>[],
          socialMedias: event.card.isCompanyAutofilled == true
              ? <SocialMediaHandle>[]
              : event.card.businessSocialMedia ?? <SocialMediaHandle>[],
          logoCard: event.card.isCompanyAutofilled == true
              ? LogoCard()
              : event.card.logoCard ?? LogoCard(),
          products: event.card.isCompanyAutofilled == true
              ? []
              : event.card.product ?? [],
          brochures: event.card.isCompanyAutofilled == true
              ? []
              : event.card.brochure ?? []),
    );
    businessNameController.text = event.card.isCompanyAutofilled == true
        ? ''
        : event.card.businessDetails?.businessName ?? '';
    companyController.text = event.card.businessDetails?.company ?? '';
    mailController.text = event.card.isCompanyAutofilled == true
        ? ''
        : event.card.businessDetails?.email ?? '';
    mobileController.text = event.card.isCompanyAutofilled == true
        ? ''
        : event.card.businessDetails?.mobileNumber ?? '';
    websiteLinkController.text = event.card.isCompanyAutofilled == true
        ? ''
        : event.card.businessDetails?.websiteLink ?? '';
    addressController.text = event.card.isCompanyAutofilled == true
        ? ''
        : event.card.businessDetails?.address ?? '';
    logoStoryController.text = event.card.isCompanyAutofilled == true
        ? ''
        : event.card.logoCard?.logoStory ?? '';
    accountNumberController.text = event.card.isCompanyAutofilled == true
        ? ''
        : event.card.bankDetails?.accountNumber ?? '';
    ifscController.text = event.card.isCompanyAutofilled == true
        ? ''
        : event.card.bankDetails?.ifscCode ?? '';
    nameOfCompanyController.text = event.card.isCompanyAutofilled == true
        ? ''
        : event.card.bankDetails?.nameOfCompany ?? '';
    gstNumberController.text = event.card.isCompanyAutofilled == true
        ? ''
        : event.card.bankDetails?.gstMembershipDetails ?? '';
    upiDetailController.text = event.card.isCompanyAutofilled == true
        ? ''
        : event.card.bankDetails?.upiDetails ?? '';
    print('user ===> $business');
    if (business) {
      final user = await SecureStorage.getUserDetails();
      websiteLinkController.text = websiteLinkController.text == ''
          ? user.websiteLink ?? ''
          : websiteLinkController.text;
      mailController.text =
          mailController.text == '' ? user.email ?? '' : mailController.text;
      companyController.text = companyController.text == ''
          ? user.companyName ?? ''
          : companyController.text;
      mobileController.text = mobileController.text == ''
          ? user.phoneNumber ?? ''
          : mobileController.text;
      addressController.text = addressController.text == ''
          ? user.address ?? ''
          : addressController.text;
    }
  }

  FutureOr<void> createBankingData(CreateBankingData event, emit) async {
    if (state.bankDetailsCreateId != null) return;
    emit(state.copyWith(
        accreditionAdded: false,
        branchAdded: false,
        brochureAdded: false,
        productAdded: false,
        companyDataRemoved: false,
        socialMediaAdded: false,
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
        accreditionAdded: false,
        branchAdded: false,
        brochureAdded: false,
        productAdded: false,
        socialMediaAdded: false,
        businessLoading: true,
        businessAdded: false,
        hasError: false,
        companyDataRemoved: false,
        message: null,
        gotCompanyData: false));
    final BusinessDetails businessDetails = BusinessDetails(
        address: addressController.text.trim().isEmpty
            ? null
            : addressController.text,
        businessName: businessNameController.text.trim().isEmpty
            ? null
            : businessNameController.text,
        company: companyController.text.trim().isEmpty
            ? null
            : companyController.text,
        websiteLink: websiteLinkController.text.trim().isEmpty
            ? null
            : websiteLinkController.text,
        email:
            mailController.text.trim().isNotEmpty ? mailController.text : null,
        mobileNumber: mobileController.text.trim().isNotEmpty
            ? mobileController.text
            : null,
        isCompanySelected: false,
        isVerified: false);
    final result = await cardService.createBusinessDataCard(
        businessDetails: businessDetails,
        id: state.currentCard!.businessDetailsId!);
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
    if (event.search?.search == null || event.search?.search == '') {
      return emit(state.copyWith(
          accreditionAdded: false,
          branchAdded: false,
          companyDataRemoved: false,
          brochureAdded: false,
          productAdded: false,
          socialMediaAdded: false,
          gotCompanyData: false,
          companiesList: <Company>[]));
    }
    final result = await cardService.getCompanies(search: event.search);
    result.fold((l) => emit(state), (getCompanysResponseModel) {
      return emit(state.copyWith(
          accreditionAdded: false,
          branchAdded: false,
          brochureAdded: false,
          productAdded: false,
          socialMediaAdded: false,
          companyDataRemoved: false,
          gotCompanyData: false,
          companiesList:
              getCompanysResponseModel.companies ?? state.companiesList));
    });
  }

  FutureOr<void> getCompnayDetails(GetCompnayDetails event, emit) async {
    emit(state.copyWith(
        loadCompanyData: true,
        message: null,
        hasError: false,
        accreditionAdded: false,
        branchAdded: false,
        companyDataRemoved: false,
        brochureAdded: false,
        productAdded: false,
        socialMediaAdded: false,
        gotCompanyData: false));
    final result = await cardService.createBusinessDataCard(
        businessDetails: BusinessDetails(
            company: event.id.toString(),
            isCompanySelected: true,
            isVerified: true),
        id: state.currentCard!.businessDetails!.id!);
    result.fold(
        (failure) => emit(state.copyWith(
            loadCompanyData: false,
            hasError: true,
            gotCompanyData: false,
            message: 'failed to add company data to profile')), (business) {
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

  FutureOr<void> removeBusinessData(RemoveBusinessData event, emit) async {
    emit(state.copyWith(
        loadCompanyData: true,
        message: null,
        companyDataRemoved: false,
        hasError: false,
        accreditionAdded: false,
        branchAdded: false,
        brochureAdded: false,
        productAdded: false,
        socialMediaAdded: false,
        gotCompanyData: false));
    final result = await cardService.createBusinessDataCard(
        businessDetails: BusinessDetails(
            company: null, isCompanySelected: false, isVerified: false),
        id: state.currentCard!.businessDetails!.id!);
    result.fold(
        (failure) => emit(state.copyWith(
            loadCompanyData: false,
            hasError: true,
            gotCompanyData: false,
            message: 'Failed to add company data to profile')), (business) {
      print('got company details');
      emit(state.copyWith(
          businessData: BusinessDetails(),
          gotCompanyData: false,
          loadCompanyData: false,
          companyDataRemoved: true,
          message: 'company data removed from your profile'));
      businessNameController.text = business.businessName ?? '';
      mailController.text = business.email ?? '';
      mobileController.text = business.mobileNumber ?? '';
      addressController.text = business.address ?? '';
      websiteLinkController.text = business.websiteLink ?? '';
      logoStoryController.text = business.logoStory ?? '';
      companyController.text = business.company ?? '';
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
      emit(state.copyWith(
        isBusiness: business,
        companyDataRemoved: false,
        gotCompanyData: false,
        accreditionAdded: false,
        branchAdded: false,
        brochureAdded: false,
        productAdded: false,
        socialMediaAdded: false,
      ));
    });
  }

  FutureOr<void> addLogo(AddLogo event, emit) async {
    emit(state.copyWith(logoImageLoading: true, logoPickImageError: false));
    final image = await ImagePickerClass.getImage(camera: event.isCam);
    if (image != null) {
      LogoCard logoCard = state.logoCard!.copyWith(logo: image.base64);
      emit(state.copyWith(
        logo: image,
        logoImageLoading: false,
        companyDataRemoved: false,
        logoPickImageError: false,
        gotCompanyData: false,
        logoCard: logoCard,
        accreditionAdded: false,
        branchAdded: false,
        brochureAdded: false,
        productAdded: false,
        socialMediaAdded: false,
      ));
    } else {
      emit(state.copyWith(logoImageLoading: false, logoPickImageError: true));
    }
  }

  FutureOr<void> uploadLogo(UploadLogo event, emit) async {
    emit(state.copyWith(
      logoPickImageError: false,
      logoAdded: false,
      companyDataRemoved: false,
      logoLoading: true,
      accreditionAdded: false,
      branchAdded: false,
      brochureAdded: false,
      productAdded: false,
      socialMediaAdded: false,
      message: null,
    ));
    LogoCard logoCard = state.logoCard!.copyWith(
      logoStory: logoStoryController.text.trim(),
      cardId: state.currentCard!.id!,
    );
    if (state.logoCard!.id == null) {
      final result = await cardPatchRepo.addLogo(logoCard: logoCard);
      result.fold(
          (l) => emit(state.copyWith(
              logoAdded: false, logoLoading: false, message: null)),
          (r) => emit(state.copyWith(
              logoAdded: true,
              logoLoading: false,
              message: null,
              logoCard: r)));
    } else {
      final result = await cardPatchRepo.patchLogo(logoCard: logoCard);
      result.fold(
          (l) => emit(state.copyWith(
              logoAdded: false, logoLoading: false, message: null)),
          (r) => emit(state.copyWith(
              logoAdded: true,
              logoLoading: false,
              message: null,
              logoCard: r)));
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
        accreditionAdded: false,
        branchAdded: false,
        brochureAdded: false,
        productAdded: false,
        socialMediaAdded: false,
        gotCompanyData: false));
  }

  FutureOr<void> addBrochure(AddBrochure event, emit) async {
    emit(state.copyWith(
      brochureLoading: true,
      accreditionAdded: false,
      branchAdded: false,
      brochureAdded: false,
      productAdded: false,
      companyDataRemoved: false,
      socialMediaAdded: false,
    ));
    final response = await cardPatchRepo.addBrochure(brochure: event.brochure);
    response.fold(
        (l) => emit(state.copyWith(brochureLoading: false)),
        (r) => emit(state.copyWith(
            brochureAdded: true,
            brochureLoading: false,
            brochures: [...state.brochures, r])));
  }

  FutureOr<void> updateBrochure(UpdateBrochure event, emit) async {
    emit(state.copyWith(
      brochureLoading: true,
      accreditionAdded: false,
      branchAdded: false,
      brochureAdded: false,
      productAdded: false,
      companyDataRemoved: false,
      socialMediaAdded: false,
    ));
    final response =
        await cardPatchRepo.updateBrochure(brochure: event.brochure);
    response.fold((l) => emit(state.copyWith(brochureLoading: false)), (r) {
      List<Brochure> broc = List.from(state.brochures);
      int index = broc.indexWhere((element) => element.id == event.brochure.id);
      broc[index] = r;
      return emit(state.copyWith(
          brochureAdded: true, brochureLoading: false, brochures: broc));
    });
  }

  FutureOr<void> addBrochures(AddBrochures event, emit) async {
    emit(state.copyWith(
      brochureLoading: true,
      accreditionAdded: false,
      branchAdded: false,
      brochureAdded: false,
      productAdded: false,
      companyDataRemoved: false,
      socialMediaAdded: false,
    ));
    final result = await pdfPicker.pickPDF();
    PdfModel pdf = PdfModel();
    result.fold((l) {
      return;
    }, (r) {
      pdf = r;
    });
    if (pdf.base64 == null) {
      return emit(state.copyWith(brochureLoading: false));
    }
    final response = await cardPatchRepo.addBrochure(
        brochure: Brochure(file: pdf.base64, cardId: state.currentCard!.id!));
    response.fold(
        (l) => emit(state.copyWith(brochureLoading: false)),
        (r) => emit(state.copyWith(
            brochureAdded: true,
            brochureLoading: false,
            brochures: [...state.brochures, r])));
  }

  FutureOr<void> removeBrochure(RemoveBrochure event, emit) async {
    emit(state.copyWith(
      brochureDeleteLoading: true,
      accreditionAdded: false,
      branchAdded: false,
      brochureAdded: false,
      productAdded: false,
      companyDataRemoved: false,
      socialMediaAdded: false,
    ));
    final result = await cardPatchRepo.deleteBrochure(id: event.id);
    result.fold((l) => emit(state.copyWith(brochureDeleteLoading: false)), (r) {
      final List<Brochure> list = [];
      for (Brochure brochure in state.brochures) {
        if (brochure.id != event.id) {
          list.add(brochure);
        }
      }
      emit(state.copyWith(brochures: list, brochureDeleteLoading: false));
    });
  }

  FutureOr<void> addBranch(AddBranch event, emit) async {
    emit(state.copyWith(
      branchLoading: true,
      accreditionAdded: false,
      branchAdded: false,
      brochureAdded: false,
      productAdded: false,
      companyDataRemoved: false,
      socialMediaAdded: false,
    ));
    final response =
        await cardPatchRepo.addBranchOffice(branchOffice: event.branch);
    response.fold(
        (l) => emit(state.copyWith(branchLoading: false)),
        (r) => emit(state.copyWith(
            branchAdded: true,
            branchLoading: false,
            branchOffices: [...state.branchOffices, r])));
  }

  FutureOr<void> updateBranch(UpdateBranch event, emit) async {
    emit(state.copyWith(
      branchLoading: true,
      accreditionAdded: false,
      branchAdded: false,
      brochureAdded: false,
      companyDataRemoved: false,
      productAdded: false,
      socialMediaAdded: false,
    ));
    final result = await cardPatchRepo.updateBranchOffice(
        id: event.id, branchOffice: event.branch);
    result.fold((l) => emit(state.copyWith(branchLoading: false)), (r) {
      List<BranchOffice> branches = List.from(state.branchOffices);
      print('list ${branches}');
      int index = branches.indexWhere((element) => element.id == event.id);
      print(index);
      branches[index] = r;
      print(r.toJson());
      return emit(state.copyWith(
          branchAdded: true, branchLoading: false, branchOffices: branches));
    });
  }

  FutureOr<void> removeBranch(RemoveBranch event, emit) async {
    emit(state.copyWith(
      branchDeleteLoading: true,
      accreditionAdded: false,
      companyDataRemoved: false,
      branchAdded: false,
      brochureAdded: false,
      productAdded: false,
      socialMediaAdded: false,
    ));
    final result = await cardPatchRepo.deleteBranchOffice(id: event.id);
    result.fold((l) => emit(state.copyWith(branchDeleteLoading: false)), (r) {
      final List<BranchOffice> list = [];
      for (BranchOffice branchOffice in state.branchOffices) {
        if (branchOffice.id != event.id) {
          list.add(branchOffice);
        }
      }
      emit(state.copyWith(branchOffices: list, branchDeleteLoading: false));
    });
  }

  FutureOr<void> addProduct(AddProduct event, emit) async {
    emit(state.copyWith(
      pickImageError: false,
      productLoading: true,
      companyDataRemoved: false,
      accreditionAdded: false,
      branchAdded: false,
      brochureAdded: false,
      productAdded: false,
      socialMediaAdded: false,
    ));
    if (event.edit) {
      final images = event.product.image ??
          <ImageCard>[].where((element) => element.id == null).toList();
      if (images.isNotEmpty) {
        await cardPatchRepo.updateProductImages(
            productImageAddingModel: ProductImageAddingModel(
                productId: event.product.id, image: images));
      }
      final Product prod = Product(
          id: event.product.id,
          cardId: event.product.cardId,
          description: event.product.description,
          label: event.product.label,
          enquiry: event.product.enquiry);
      final response = await cardPatchRepo.updateProduct(
          product: prod, id: event.product.id!);
      response.fold((l) => emit(state.copyWith(productLoading: false)), (r) {
        List<Product> prodctList = List.from(state.products);
        final index =
            prodctList.indexWhere((element) => element.id == event.product.id);
        prodctList[index] = r;
        return emit(state.copyWith(
          productAdded: true,
          productLoading: false,
          productImages: [],
          products: prodctList,
        ));
      });
    } else {
      print('product iamge 0 -> ${event.product.image![0].image}');
      final response = await cardPatchRepo.addProduct(product: event.product);
      response.fold((l) => emit(state.copyWith(productLoading: false)), (r) {
        if (r.image != null) {
          imageList = r.image!;
        }
        return emit(state.copyWith(
          productAdded: true,
          productLoading: false,
          productImages: [],
          products: [...state.products, r],
        ));
      });
    }
  }

  FutureOr<void> removeProduct(RemoveProduct event, emit) async {
    emit(state.copyWith(
      productDeleteLoading: true,
      accreditionAdded: false,
      branchAdded: false,
      brochureAdded: false,
      productAdded: false,
      companyDataRemoved: false,
      socialMediaAdded: false,
    ));
    final result = await cardPatchRepo.deleteProduct(id: event.id);
    result.fold((l) => emit(state.copyWith(productDeleteLoading: false)), (r) {
      final List<Product> list = [];
      for (Product product in state.products) {
        if (product.id != event.id) {
          list.add(product);
        }
      }
      emit(state.copyWith(products: list, productDeleteLoading: false));
    });
  }

  FutureOr<void> updateProduct(UpdateProduct event, emit) async {
    emit(state.copyWith(
      productUpdateLoading: true,
      accreditionAdded: false,
      branchAdded: false,
      brochureAdded: false,
      companyDataRemoved: false,
      productAdded: false,
      socialMediaAdded: false,
      productUpdated: false,
    ));
    final result = await cardPatchRepo.updateProduct(
      id: event.id,
      product: event.product,
    );
    result.fold(
        (l) => emit(state.copyWith(
              productUpdateLoading: false,
              productUpdated: false,
            )), (r) {
      emit(state.copyWith(
        productUpdateLoading: false,
        productUpdated: true,
      ));
    });
  }

  FutureOr<void> addAccredition(AddAccredition event, emit) async {
    emit(state.copyWith(
      accreditionLoading: true,
      accreditionAdded: false,
      companyDataRemoved: false,
      branchAdded: false,
      brochureAdded: false,
      productAdded: false,
      socialMediaAdded: false,
    ));
    if (event.edit) {
      final images = event.accredition.images ??
          <ImageCard>[].where((element) => element.id == null).toList();
      print('image update length ${images.length}');
      if (images.isNotEmpty) {
        await cardPatchRepo.uploadAccreditionImages(
            accreditionImageAddingModel: AccreditionImageAddingModel(
                accreditionId: event.accredition.id, image: images));
      }
      final result = await cardPatchRepo.updateAccredition(
          accredition: Accredition(
        label: event.accredition.label,
        description: event.accredition.description,
        date: event.accredition.date,
        cardId: event.accredition.cardId,
        id: event.accredition.id,
      ));
      result.fold((l) => emit(state.copyWith(accreditionLoading: false)), (r) {
        List<Accredition> accreditation = List.from(state.accreditions);
        final index = accreditation.indexWhere((element) => element.id == r.id);
        accreditation[index] = r;
        return emit(state.copyWith(
            accreditionAdded: true,
            accreditionLoading: false,
            accreditions: accreditation));
      });
    } else {
      final response =
          await cardPatchRepo.addAcredition(accredition: event.accredition);
      response.fold(
          (l) => emit(state.copyWith(accreditionLoading: false)),
          (r) => emit(state.copyWith(
              accreditionLoading: false,
              accreditionAdded: true,
              accreditions: [...state.accreditions, r])));
    }
  }

  FutureOr<void> removeAccredition(RemoveAccredition event, emit) async {
    emit(state.copyWith(
      accreditionDeleteLoading: true,
      accreditionAdded: false,
      branchAdded: false,
      companyDataRemoved: false,
      brochureAdded: false,
      productAdded: false,
      socialMediaAdded: false,
    ));
    final result = await cardPatchRepo.deleteAcredition(id: event.id);
    result.fold((l) => emit(state.copyWith(accreditionDeleteLoading: false)),
        (r) {
      final List<Accredition> list = [];
      for (Accredition accredition in state.accreditions) {
        if (accredition.id != event.id) {
          list.add(accredition);
        }
      }
      emit(state.copyWith(accreditions: list, accreditionDeleteLoading: false));
    });
  }

  FutureOr<void> addSocialMedia(AddSocialMedia event, emit) async {
    emit(state.copyWith(
      message: null,
      socialMediaLoading: true,
      accreditionAdded: false,
      branchAdded: false,
      brochureAdded: false,
      companyDataRemoved: false,
      productAdded: false,
      socialMediaAdded: false,
    ));
    final result = await cardPatchRepo.addBusinessSocialMedia(
        socialMediaHandle: event.socialMediaHandle);
    result.fold((l) => emit(state.copyWith(socialMediaLoading: false)), (r) {
      return emit(state.copyWith(
          socialMediaAdded: true,
          socialMediaLoading: false,
          socialMedias: [...state.socialMedias, r]));
    });
  }

  FutureOr<void> removeSocialMedia(RemoveSocialMedia event, emit) async {
    emit(state.copyWith(
      message: null,
      socialMediaDeleteLoading: true,
      accreditionAdded: false,
      branchAdded: false,
      brochureAdded: false,
      productAdded: false,
      companyDataRemoved: false,
      socialMediaAdded: false,
    ));
    final result = await cardPatchRepo.deleteSocialMedia(id: event.id);
    result.fold((l) => emit(state.copyWith(socialMediaDeleteLoading: false)),
        (r) {
      List<SocialMediaHandle> list = List.from(state.socialMedias);
      list.removeWhere((element) => element.id == event.id);
      return emit(
          state.copyWith(socialMediaDeleteLoading: false, socialMedias: list));
    });
  }

  FutureOr<void> removeBusinessSocialMedia(
      RemoveBusinessSocialMedia event, emit) async {
    emit(state.copyWith(
      message: null,
      socialMediaDeleteLoading: true,
      accreditionAdded: false,
      branchAdded: false,
      companyDataRemoved: false,
      brochureAdded: false,
      productAdded: false,
      socialMediaAdded: false,
    ));
    final result = await cardPatchRepo.deleteBusinessSocialMedia(id: event.id);
    result.fold((l) => emit(state.copyWith(socialMediaDeleteLoading: false)),
        (r) {
      List<SocialMediaHandle> list = List.from(state.businessSocialMedias);
      list.removeWhere((element) => element.id == event.id);
      return emit(
          state.copyWith(socialMediaDeleteLoading: false, socialMedias: list));
    });
  }
}
