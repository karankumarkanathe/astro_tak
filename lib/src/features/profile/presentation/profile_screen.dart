import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../generated/l10n.dart';
import '../../../../values/assets.dart';
import '../../../helpers/dialog_utility/dialog_utility.dart';
import '../application/bloc/profile_bloc.dart';
import '../domain/entities/add_user_request_model.dart';
import '../domain/entities/family_member_list_response.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profile_screen";
  ProfileScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        _buildTabs(context),
        BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.profileAction == ProfileAction.add ||
                state.profileAction == ProfileAction.edit) {
              return _buildAddNewProfileEvent(context, state);
            }
            return _buildFamilyListWidget(context, state);
          },
        )
      ],
    ));
  }

  SingleChildScrollView _buildAddNewProfileEvent(
      BuildContext context, ProfileState state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () =>
                      context.read<ProfileBloc>().add(BackToFamilyListEvent()),
                  icon: const Icon(Icons.chevron_left)),
              Text(S.current.titleAddNewProfile)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: FormBuilder(
                key: _formKey,
                initialValue: _getInitialValues(state, context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.current.name),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'firstName',
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      onChanged: (_) {},
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: S.current.enterValidName),
                      ]),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(S.current.dateOfBirth),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'dobDay',
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                            onChanged: (_) {},
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: S.current.invalidDD),
                              FormBuilderValidators.numeric(context),
                              FormBuilderValidators.max(context, 31),
                            ]),
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'dobMonth',
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                            onChanged: (_) {},
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: S.current.invalidMM),
                              FormBuilderValidators.numeric(context),
                              FormBuilderValidators.max(context, 12),
                            ]),
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'dobYear',
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                            onChanged: (_) {},
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: S.current.invalidYYY),
                            ]),
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(S.current.timeOfBirth),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'tobHour',
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                            onChanged: (_) {},
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: S.current.invalidHH),
                              FormBuilderValidators.numeric(context),
                              FormBuilderValidators.max(context, 12),
                            ]),
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'tobMin',
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                            onChanged: (_) {},
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: S.current.invalidMM),
                              FormBuilderValidators.numeric(context),
                              FormBuilderValidators.max(context, 60),
                            ]),
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              state.meridian == Meridian.am
                                                  ? Theme.of(context)
                                                      .secondaryHeaderColor
                                                  : Colors.white)),
                                  onPressed: () => context
                                      .read<ProfileBloc>()
                                      .add(OnMeridianChangeEvent(Meridian.am)),
                                  child: Text(
                                    S.current.am,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontSize: 12,
                                            color: state.meridian == Meridian.am
                                                ? Colors.white
                                                : Colors.black),
                                  )),
                            ),
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              state.meridian == Meridian.pm
                                                  ? Theme.of(context)
                                                      .secondaryHeaderColor
                                                  : Colors.white)),
                                  onPressed: () => context
                                      .read<ProfileBloc>()
                                      .add(OnMeridianChangeEvent(Meridian.pm)),
                                  child: Text(
                                    S.current.pm,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontSize: 12,
                                            color: state.meridian == Meridian.pm
                                                ? Colors.white
                                                : Colors.black),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(S.current.placeOfBirth),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderDropdown(
                      name: 'birthPlace',
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      onChanged: (_) {},
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: S.current.pleaseSelectCity),
                      ]),
                      items: state.places
                          .map((places) => DropdownMenuItem(
                                value: places,
                                child: Text(places.placeName),
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text(S.current.gender)),
                        Expanded(child: Text(S.current.relation)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderDropdown(
                            name: 'gender',
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                            onChanged: (_) {},
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: S.current.invalidGender),
                            ]),
                            items: ['MALE', 'FEMALE']
                                .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text(gender),
                                    ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: FormBuilderDropdown(
                            name: 'relationId',
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                            onChanged: (_) {},
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: S.current.invalidRelation),
                            ]),
                            items: ['Brother']
                                .map((relation) => DropdownMenuItem(
                                      value: 3,
                                      child: Text(relation),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor)),
                          onPressed: () {
                            _onSaveChangesPressed(state, context);
                          },
                          child: Text(S.current.saveChanges)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  void _onSaveChangesPressed(ProfileState state, BuildContext context) {
    if (_formKey.currentState!.saveAndValidate()) {
      final values = _formKey.currentState!.value;
      final birthDetails = BirthDetails(
          dobYear: int.parse(values['dobYear']),
          dobMonth: int.parse(values['dobMonth']),
          dobDay: int.parse(values['dobDay']),
          tobHour: int.parse(values['tobHour']),
          tobMin: int.parse(values['tobMin']),
          meridiem: state.meridian == Meridian.am ? "AM" : "PM");
      AddUserRequestModel addUserRequestModel = AddUserRequestModel(
          birthDetails: birthDetails,
          birthPlace: values['birthPlace'],
          firstName: values['firstName'],
          lastName: '',
          relationId: values['relationId'],
          gender: values['gender']);
      if (state.profileAction == ProfileAction.add) {
        context.read<ProfileBloc>().add(AddProfileEvent(addUserRequestModel));
      }

      if (state.profileAction == ProfileAction.edit) {
        if (state.familyProfile == null) return;
        final uuid = state.familyProfile!.uuid!;
        context
            .read<ProfileBloc>()
            .add(UpdateProfileEvent(uuid, addUserRequestModel));
      }
    }
  }

  Widget _buildFamilyListWidget(BuildContext context, ProfileState state) {
    return Column(
      children: [
        _buildWalletContainer(context),
        state.familyList.isEmpty
            ? Center(
                child: Text(S.current.noFamilyMember),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _columnHeaderWidget(context, S.current.name),
                          _columnHeaderWidget(context, S.current.dob),
                          _columnHeaderWidget(context, S.current.tob),
                          _columnHeaderWidget(context, S.current.relation),
                          const Spacer()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ...state.familyList
                        .map(
                          (e) => _buildFamilyMemberCell(context, e),
                        )
                        .toList()
                  ],
                ),
              ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor)),
            onPressed: () =>
                context.read<ProfileBloc>().add(AddProfileClickedEvent()),
            child: Text(S.current.btnTxtAddNewProfile))
      ],
    );
  }

  Widget _buildFamilyMemberCell(BuildContext context, AllRelative relative) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _rowDataWidget(context, relative.firstName ?? ''),
              _rowDataWidget(context, _getDobString(relative)),
              _rowDataWidget(context, _getTobString(relative)),
              _rowDataWidget(context, relative.relation ?? ''),
              Row(
                children: [
                  IconButton(
                      iconSize: 15,
                      onPressed: () {
                        context
                            .read<ProfileBloc>()
                            .add(EditProfileClickedEvent(relative));
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      )),
                  IconButton(
                      iconSize: 15,
                      onPressed: () {
                        DialogUtility.showTwoButtonDialog(
                            context: context,
                            title: S.current.alertTxtDelete,
                            onYesPressed: () {
                              context.read<ProfileBloc>().add(
                                  DeleteFamilyMemberEvent(
                                      uuid: relative.uuid ?? ''));
                            });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> _getInitialValues(
      ProfileState state, BuildContext context) {
    if (state.profileAction != ProfileAction.edit) return {};
    if (state.familyProfile == null) return {};
    final profile = state.familyProfile!;

    context.read<ProfileBloc>().add(OnMeridianChangeEvent(
        profile.birthDetails!.meridiem == "AM" ? Meridian.am : Meridian.pm));

    return {
      'firstName': profile.firstName,
      'dobDay': profile.birthDetails!.dobDay.toString(),
      'dobMonth': profile.birthDetails!.dobMonth.toString(),
      'dobYear': profile.birthDetails!.dobYear.toString(),
      'tobHour': profile.birthDetails!.tobHour.toString(),
      'tobMin': profile.birthDetails!.tobMin.toString(),
      //'birthPlace': profile.birthPlace,
      'gender': profile.gender!.toUpperCase(),
      'relationId': 3
    };
  }

  String _getDobString(AllRelative relative) {
    if (relative.birthDetails != null) {
      final day = relative.birthDetails!.dobDay ?? 0;
      final month = relative.birthDetails!.dobMonth ?? 0;
      final year = relative.birthDetails!.dobYear ?? 0;
      return "$day-$month-$year";
    }
    return "00-00-0000";
  }

  String _getTobString(AllRelative relative) {
    if (relative.birthDetails != null) {
      final min = relative.birthDetails!.tobMin ?? 0;
      final hour = relative.birthDetails!.tobHour ?? 0;
      return "$hour:$min";
    }
    return "00:00";
  }

  SizedBox _rowDataWidget(BuildContext context, String title) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      child: Text(
        title,
        textAlign: TextAlign.start,
        textScaleFactor: 0.7,
      ),
    );
  }

  SizedBox _columnHeaderWidget(BuildContext context, String title) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 6,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor, fontSize: 10),
        textScaleFactor: 0.9,
      ),
    );
  }

  Widget _buildWalletContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).secondaryHeaderColor.withOpacity(0.4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.account_balance_wallet,
                color: Theme.of(context).secondaryHeaderColor,
              ),
              Text(
                S.current.walletBalance + ": ₹0",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Theme.of(context).secondaryHeaderColor),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      S.current.addMoney,
                      style: Theme.of(context).textTheme.button!.copyWith(
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildTabs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                child: Text(
                  S.current.basicProfile,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 155, 148, 148)),
                )),
          ),
          Expanded(
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor)),
                onPressed: () {},
                child: Text(
                  S.current.friendsFamilyProfile,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 12, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        title: Image.asset(
          Assets.logo,
          height: 50,
        ),
        actions: [_buildLogoutButton(context)],
        bottom: TabBar(
          indicatorColor: Theme.of(context).primaryColor,
          tabs: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.current.myProfile),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.current.orderHistory),
            ),
          ],
        ));
  }

  InkWell _buildLogoutButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
              child: Text(
                S.current.logout,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
