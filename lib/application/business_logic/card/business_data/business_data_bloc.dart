import 'dart:async';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/data/features/pdf/pdf_picker.dart';
import 'package:bizkit/domain/model/card/accridition/accredition.dart';
import 'package:bizkit/domain/model/card/banking_detail/bank_details.dart';
import 'package:bizkit/domain/model/card/brochure/brochure.dart';
import 'package:bizkit/domain/model/card/business_detail/business_details.dart';
import 'package:bizkit/domain/model/card/email/email.dart';
import 'package:bizkit/domain/model/card/mobile_number/mobile_number.dart';
import 'package:bizkit/domain/model/card/product/product.dart';
import 'package:bizkit/domain/model/card/social_media_handle/social_media_handle.dart';
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
  }

  FutureOr<void> createBankingData(CreateBankingData event, emit) async {
    final BankDetails bankDetails = state.bankDetails.copyWith(
        accredition: state.accreditions
            .map((e) => Accredition(
                description: e.description,
                label: e.label,
                image: e.image.multipartFile))
            .toList(),
        nameOfCompany: nameOfCompanyController.text.trim(),
        acccountNumber: accountNumber,
        ifscCode: ifsc,
        upiDetails: upiDetailController.text.trim(),
        gstMembershipDetails: gstNumberController.text.trim(),
        branchOffices: branchOfficeController.text.trim());
        emit(state.copyWith(bankDetails:bankDetails));
  }

  FutureOr<void> createBusinessData(CreateBusinessData event, emit) async {
    final BusinessDetails businessDetails = state.businessDetails.copyWith(
        address: addressController.text.trim(),
        businessName: businessNameController.text.trim(),
        company: companyController.text.trim(),
        designation: designationController.text.trim(),
        logoStory: logoStoryController.text.trim(),
        websiteLink: websiteLinkController.text.trim(),
        email: mailController.text.isNotEmpty
            ? [Email(email: mailController.text.trim())]
            : [],
        mobileNumber: mobileController.text.isNotEmpty
            ? [
                MobileNumber(
                  mobileNumber: mobileController.text.trim(),
                )
              ]
            : [],
        logo: state.logo?.multipartIamge,
        socialMediaHandles: state.socialMedias,
        product: state.products
            .map((e) => Product(
                enquiry: e.enquiry,
                label: e.label,
                description: e.description,
                product: e.product.multipartIamge))
            .toList(),
        brochure: state.brochures);
    emit(state.copyWith(businessDetails: businessDetails));
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
      final List<Brochure> list = List.from(state.brochures);
      list.add(Brochure(file: pdf));
      emit(state.copyWith(brochures: list));
    });
  }

  FutureOr<void> removeBrochure(RemoveBrochure event, emit) async {
    final List<Brochure> list = [];
    for (Brochure brochure in state.brochures) {
      if (state.brochures[event.index] != brochure) {
        list.add(brochure);
      }
    }
    emit(state.copyWith(brochures: list));
  }

  FutureOr<void> addProduct(AddProduct event, emit) async {
    final List<Product> list = List.from(state.products);
    list.add(event.product);
    emit(state.copyWith(products: list));
  }

  FutureOr<void> removeProduct(RemoveProduct event, emit) async {
    final List<Product> list = [];
    for (Product product in state.products) {
      if (state.products[event.index] != product) {
        list.add(product);
      }
    }
    emit(state.copyWith(products: list));
  }

  FutureOr<void> addAccredition(AddAccredition event, emit) async {
    final List<Accredition> list = List.from(state.accreditions);
    list.add(event.accredition);
    emit(state.copyWith(accreditions: list));
  }

  FutureOr<void> removeAccredition(RemoveAccredition event, emit) async {
    final List<Accredition> list = [];
    for (Accredition accredition in state.accreditions) {
      if (state.accreditions[event.index] != accredition) {
        list.add(accredition);
      }
    }
    emit(state.copyWith(accreditions: list));
  }

  FutureOr<void> addSocialMedia(AddSocialMedia event, emit) async {
    final List<SocialMediaHandle> list = List.from(state.socialMedias);
    list.add(event.socialMediaHandle);
    print(list.length);
    emit(state.copyWith(socialMedias: list));
  }

  FutureOr<void> removeSocialMedia(RemoveSocialMedia event, emit) async {
    final List<SocialMediaHandle> list = [];
    for (SocialMediaHandle socialMediaHandle in state.socialMedias) {
      if (state.socialMedias[event.index] != socialMediaHandle) {
        list.add(socialMediaHandle);
      }
    }
    emit(state.copyWith(socialMedias: list));
  }
}
