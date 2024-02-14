import 'dart:async';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/data/features/pdf/pdf_picker.dart';
import 'package:bizkit/domain/model/card/create_card/accridition/accredition.dart';
import 'package:bizkit/domain/model/card/create_card/banking_detail/bank_details.dart';
import 'package:bizkit/domain/model/card/create_card/brochure/brochure.dart';
import 'package:bizkit/domain/model/card/create_card/business_detail/business_details.dart';
import 'package:bizkit/domain/model/card/create_card/email/email.dart';
import 'package:bizkit/domain/model/card/create_card/mobile_number/mobile_number.dart';
import 'package:bizkit/domain/model/card/create_card/product/product.dart';
import 'package:bizkit/domain/model/card/create_card/social_media_handle/social_media_handle.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
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
  final TextEditingController designationController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController websiteLinkController = TextEditingController();
  final TextEditingController logoStoryController = TextEditingController();
  final TextEditingController nameOfCompanyController = TextEditingController();
  final TextEditingController upiDetailController = TextEditingController();
  final TextEditingController gstNumberController = TextEditingController();
  final TextEditingController branchOfficeController = TextEditingController();
  String? accountNumber, ifsc;
  final PdfPickerImpl pdfPicker;

  BusinessDataBloc(this.pdfPicker) : super(BusinessDataState.initial()) {
    on<AddAccredition>(addAccredition);
    on<RemoveAccredition>(removeAccredition);
    on<AddSocialMedia>(addSocialMedia);
    on<RemoveSocialMedia>(removeSocialMedia);
    on<AddLogo>(addLogo);
    on<AddBrochures>(addBrochure);
    on<RemoveBrochure>(removeBrochure);
    on<AddProduct>(addProduct);
    on<RemoveProduct>(removeProduct);
    on<CreateBusinessData>(createBusinessData);
    on<CreateBankingData>(createBankingData);
    on<Clear>(clear);
  }

  FutureOr<void> createBankingData(CreateBankingData event, emit) async {
    final BankDetailsCreate bankDetails = BankDetailsCreate(
        accredition: state.accreditions.isEmpty
            ? []
            : state.accreditions
                .map((e) => AccreditionCreate(
                    description: e.description,
                    label: e.label,
                    image: e.image.base64))
                .toList(),
        nameOfCompany: nameOfCompanyController.text.trim().isEmpty
            ? null
            : nameOfCompanyController.text,
        acccountNumber: accountNumber,
        ifscCode: ifsc,
        upiDetails: upiDetailController.text.trim().isEmpty
            ? null
            : upiDetailController.text,
        gstMembershipDetails: gstNumberController.text.trim().isEmpty
            ? null
            : gstNumberController.text,
        branchOffices: branchOfficeController.text.trim().isEmpty
            ? null
            : branchOfficeController.text);
    emit(state.copyWith(bankDetails: bankDetails));
  }

  FutureOr<void> createBusinessData(CreateBusinessData event, emit) async {
    final BusinessDetailsCreate businessDetails = BusinessDetailsCreate(
        address: addressController.text.trim().isEmpty
            ? null
            : addressController.text,
        businessName: businessNameController.text.trim().isEmpty
            ? null
            : businessNameController.text,
        company: companyController.text.trim().isEmpty
            ? null
            : companyController.text,
        designation: designationController.text.trim().isEmpty
            ? null
            : designationController.text,
        logoStory: logoStoryController.text.trim().isEmpty
            ? null
            : logoStoryController.text,
        websiteLink: websiteLinkController.text.trim().isEmpty
            ? null
            : websiteLinkController.text,
        email: mailController.text.isNotEmpty
            ? [
                EmailCreate(
                    email: mailController.text.trim().isEmpty
                        ? null
                        : mailController.text)
              ]
            : [],
        mobileNumber: mobileController.text.isNotEmpty
            ? [
                MobileNumberCreate(
                  mobileNumber: mobileController.text.trim().isEmpty
                      ? null
                      : mobileController.text,
                )
              ]
            : [],
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
                .toList());
    emit(state.copyWith(businessDetails: businessDetails));
  }

  FutureOr<void> clear(Clear event, emit) async {
    emit(state.copyWith());
  }

  FutureOr<void> addLogo(AddLogo event, emit) async {
    final image = await ImagePickerClass.getImage(camera: false);
    if (image != null) {
      emit(state.copyWith(logo: image));
    }
  }

  FutureOr<void> addBrochure(AddBrochures event, emit) async {
    final result = await pdfPicker.pickPDF();
    result.fold((l) {
      return;
    }, (pdf) {
      final List<BrochureCreate> list = List.from(state.brochures);
      list.add(BrochureCreate(file: pdf));
      emit(state.copyWith(brochures: list));
    });
  }

  FutureOr<void> removeBrochure(RemoveBrochure event, emit) async {
    final List<BrochureCreate> list = [];
    for (BrochureCreate brochure in state.brochures) {
      if (state.brochures[event.index] != brochure) {
        list.add(brochure);
      }
    }
    emit(state.copyWith(brochures: list));
  }

  FutureOr<void> addProduct(AddProduct event, emit) async {
    final List<ProductCreate> list = List.from(state.products);
    list.add(event.product);
    emit(state.copyWith(products: list));
  }

  FutureOr<void> removeProduct(RemoveProduct event, emit) async {
    final List<ProductCreate> list = [];
    for (ProductCreate product in state.products) {
      if (state.products[event.index] != product) {
        list.add(product);
      }
    }
    emit(state.copyWith(products: list));
  }

  FutureOr<void> addAccredition(AddAccredition event, emit) async {
    final List<AccreditionCreate> list = List.from(state.accreditions);
    list.add(event.accredition);
    emit(state.copyWith(accreditions: list));
  }

  FutureOr<void> removeAccredition(RemoveAccredition event, emit) async {
    final List<AccreditionCreate> list = [];
    for (AccreditionCreate accredition in state.accreditions) {
      if (state.accreditions[event.index] != accredition) {
        list.add(accredition);
      }
    }
    emit(state.copyWith(accreditions: list));
  }

  FutureOr<void> addSocialMedia(AddSocialMedia event, emit) async {
    final List<SocialMediaHandleCreate> list = List.from(state.socialMedias);
    list.add(event.socialMediaHandle);
    emit(state.copyWith(socialMedias: list));
  }

  FutureOr<void> removeSocialMedia(RemoveSocialMedia event, emit) async {
    final List<SocialMediaHandleCreate> list = [];
    for (SocialMediaHandleCreate socialMediaHandle in state.socialMedias) {
      if (state.socialMedias[event.index] != socialMediaHandle) {
        list.add(socialMediaHandle);
      }
    }
    emit(state.copyWith(socialMedias: list));
  }
}
