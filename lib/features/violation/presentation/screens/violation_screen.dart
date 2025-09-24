import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xullo/features/violation/domain/entities/violation.dart';
import 'package:xullo/features/violation/presentation/controller/violation/violation_provider.dart';
import 'package:xullo/features/violation/presentation/controller/violation/state/violation_state.dart';
import 'package:xullo/features/violation/presentation/screens/type/index.dart';

import '../../../../core/helpers/index.dart';

class ViolationScreen extends HookConsumerWidget {
  const ViolationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final violations = useState([]);
    final isLoading = useState(true);

    useEffect(() {
      Future.microtask(() => ref.read(violationNotifierProvider.notifier).getAllViolation());
      return null;
    }, []);

    ref.listen(violationNotifierProvider, (prev, next) {
      next.when(
          error: (error) {
            isLoading.value = false;
          },
          success: (violation){
            violations.value = violation;
            isLoading.value = false;
          },
          loading:() {
            isLoading.value = true;
          }, initial: () {  },);
    });

    return Scaffold(
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          :RefreshIndicator(
        onRefresh: () async {
          await ref.read(violationNotifierProvider.notifier).getAllViolation();
        },
        child: violations.value.isEmpty
            ? ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(height: 300),
            Center(child: Text('No violation available.')),
          ],
        )
            : ListView.builder(
          itemCount: violations.value.length,
          itemBuilder: (context, index) {
            final Violation violation = violations.value[index];
            final typeInfo = violationTypeMap[violation.type];
            final title = typeInfo?['title'] ?? 'Unknown Violation';
            final description = typeInfo?['description'] ?? '';
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Theme.of(context).colorScheme.secondary,
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 16,right: 16),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title),
                      Text(
                        formatViolationDateTime(violation.created_at.toString()),
                        style: Theme.of(context).textTheme.bodySmall
                            ?.copyWith(color: Colors.grey[400]),
                      ),
                    ],
                  ),
                  subtitle: Text(description),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
