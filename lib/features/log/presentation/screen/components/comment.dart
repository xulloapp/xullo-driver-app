import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:xullo/features/log/presentation/controller/state/log_state.dart';

import '../../../../../core/helpers/index.dart';
import '../../../../../core/validators/index.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../controller/log_provider.dart';

class Comment extends HookConsumerWidget {
  final String tripId;
  final String? value;

  const Comment({super.key, required this.tripId, this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final commentValue = useState<String?>(value);
    final currentInput = useState<String?>(value);
    final isChanged = useState<bool>(false);
    final theme = Theme.of(context).colorScheme;

    // Listen to state changes (e.g., comment updated from backend)
    ref.listen(logNotifierProvider, (prev, next) {
      next.maybeWhen(
        errorComment: (error) {
          handleFieldErrors(context, formKey, error.response);
        },
        comment: (data) {
          commentValue.value = data.comment;
          currentInput.value = data.comment;
          isChanged.value = false;

          // Update field value in the form
          formKey.currentState?.fields['comment']?.didChange(data.comment);
        },
        orElse: () {},
      );
    });

    return FormBuilder(
      key: formKey,
      initialValue: {
        'comment': commentValue.value,
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: FormBuilderField<String>(
                name: "comment",
                validator: FormBuilderValidators.compose(AppValidators.onlyString),
                builder: (field) {
                  return TextField(
                    controller: TextEditingController.fromValue(
                      TextEditingValue(
                        text: field.value ?? '',
                        selection: TextSelection.collapsed(offset: field.value?.length ?? 0),
                      ),
                    ),
                    onChanged: (val) {
                      field.didChange(val);
                      currentInput.value = val;
                      isChanged.value = val.trim() != (commentValue.value ?? '').trim();
                    },
                    decoration: InputDecoration(
                      hintText: "Enter comment",
                      errorText: field.errorText,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: theme.tertiary),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: theme.primary),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: theme.error),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: theme.error),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: theme.tertiary.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintStyle: TextStyle(
                        color: theme.primary.withOpacity(0.8),
                      ),
                      fillColor: theme.secondary.withOpacity(1),
                      filled: true,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: isChanged.value
                  ? () {
                if (formKey.currentState?.saveAndValidate() ?? false) {
                  final formData = Map<String, dynamic>.from(formKey.currentState!.value);
                  ref.read(logNotifierProvider.notifier).comment(tripId, formData);
                }
              }
                  : null,
              color: isChanged.value
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
