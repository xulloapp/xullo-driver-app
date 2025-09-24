import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/core/configs/router-configs/router_name.dart';
import 'package:xullo/core/widgets/app_button.dart';
import 'package:xullo/core/widgets/custom_date.dart';
import 'package:xullo/features/log/presentation/controller/state/log_state.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../../../../core/helpers/index.dart';
import '../../../../../core/validators/index.dart';
import '../../../../../core/widgets/custom_redio_field.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../controller/log_provider.dart';

class FormPage1 extends HookConsumerWidget {
  const FormPage1({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    final isLoading = useState(false);
    ref.listen(logNotifierProvider, (prev, next) {
      next.maybeWhen(
          error: (error) {
            isLoading.value = false;
            handleFieldErrors(context, formKey, error.response);
          },
          orElse: () {},
          loadingForm1: (){
            isLoading.value = true;
          },
          createForm1: (data) async {
            isLoading.value = false;
            final type = formKey.currentState?.fields['type']?.value as bool?;

            type == false ? context.goNamed(RouteNames.form2,extra: data) : context.go(RouteNames.log,extra: data.trip_id.toString());
          });
    });
    return Scaffold(
      appBar: AppBar(title: Text("Log Information"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(RouteNames.dashboard),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: FormBuilder(
            key: formKey,
            initialValue: {
              "start_date": tz.TZDateTime.now(tz.local).toUtc(),
              "type": false
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomDateField(
                    name: 'start_date',
                    label: 'start time',
                    inputType: InputType.time,
                    hintText: "current date and time",
                    validators: AppValidators.date),
                const SizedBox(height: 16),
                CustomTextField(
                  name: "location",
                  validators: AppValidators.onlyString,
                  hintText: "Enter location",
                  obscureText: false,
                ),
                const SizedBox(height: 16),
                CustomRadioGroupField(
                  name: 'type',
                  title: "At this time I?",
                  options: const [
                    FormBuilderFieldOption(value: true, child: Text('Rest')),
                    FormBuilderFieldOption(value: false, child: Text('Work')),
                  ],
                  disabledValues: [true],
                ),
                const SizedBox(height: 16),
                AppButton(text: "Next", onPressed: (){
                  if(formKey.currentState?.saveAndValidate() == true){
                    ref.read(logNotifierProvider.notifier).createForm1(formKey.currentState!.value);
                  }
                },isLoading: isLoading.value,)
              ],
            ),
        ),
        ),
      ),
    );
  }
}
