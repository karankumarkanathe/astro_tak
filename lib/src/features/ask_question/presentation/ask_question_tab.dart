import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../generated/l10n.dart';
import '../application/bloc/ask_question_bloc.dart';

class AskQuestionTab extends StatelessWidget {
  AskQuestionTab({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskQuestionBloc, AskQuestionState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            state.isLoading
                ? const LinearProgressIndicator()
                : const SizedBox.shrink(),
            _buildWalletContainer(context),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.current.askQuestions,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          S.current.askQuestionDesc,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        state.questionCategories.isNotEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.current.chooseCategory,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  _buildForm(context, state),
                                  Text(
                                    S.current.ideasWhatToAsk,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  _buildListView(state),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  )
                ],
              )),
            ),
            _buildQuestionPriceContainer(context, state),
          ],
        );
      },
    );
  }

  SizedBox _buildListView(AskQuestionState state) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
          itemCount: _getItemCount(state),
          itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.diamond,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            state.questionCategories
                                .where((element) =>
                                    element.id == state.selectedCategory)
                                .first
                                .suggestions![index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 18,
                                    color:
                                        const Color.fromARGB(255, 88, 85, 85)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider()
                ],
              )),
    );
  }

  int _getItemCount(AskQuestionState state) {
    if (state.questionCategories.isEmpty) return 0;
    return state.questionCategories
        .firstWhere((element) => element.id == state.selectedCategory)
        .suggestions!
        .length;
  }

  FormBuilder _buildForm(BuildContext context, AskQuestionState state) {
    return FormBuilder(
        key: _formKey,
        initialValue: {'category': state.questionCategories.first.id},
        child: Column(
          children: [
            FormBuilderDropdown(
              name: 'category',
              allowClear: false,
              onChanged: (value) => context
                  .read<AskQuestionBloc>()
                  .add(OnCategoryChangedEvent(value as int)),
              hint: const Text('Select Category'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: state.questionCategories
                  .map((questionCategory) => DropdownMenuItem(
                        value: questionCategory.id,
                        child: Text(questionCategory.name ?? ""),
                      ))
                  .toList(),
            ),
            FormBuilderTextField(
              name: 'question',
              decoration: InputDecoration(
                  hintText: S.current.typeQuestionHere,
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor))),
              maxLength: 150,
              maxLines: 5,
              // onChanged: _onChanged,
              // valueTransformer: (text) => num.tryParse(text),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
              ]),
              keyboardType: TextInputType.text,
            ),
          ],
        ));
  }

  Container _buildWalletContainer(BuildContext context) {
    return Container(
      color: Theme.of(context).secondaryHeaderColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.current.walletBalance + ": ₹0",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                child: Text(
                  S.current.addMoney,
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Theme.of(context).secondaryHeaderColor),
                ))
          ],
        ),
      ),
    );
  }

  Container _buildQuestionPriceContainer(
      BuildContext context, AskQuestionState state) {
    return Container(
      color: Theme.of(context).secondaryHeaderColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                _priceString(state),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.normal),
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                child: Text(
                  S.current.askNow,
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Theme.of(context).secondaryHeaderColor),
                ))
          ],
        ),
      ),
    );
  }

  String _priceString(AskQuestionState state) {
    if (state.questionCategories.isEmpty) return "₹0";
    final price = state.questionCategories
        .firstWhere((element) => element.id == state.selectedCategory)
        .price;
    final categoryName = state.questionCategories
        .firstWhere((element) => element.id == state.selectedCategory)
        .name;
    return "₹$price (1 Question on $categoryName)";
  }
}
