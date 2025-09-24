import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/features/company/presentation/controller/company/company_provider.dart';
import 'package:xullo/features/company/presentation/controller/company/state/company_state.dart';
import 'package:xullo/features/company/presentation/screens/components/form.dart';

class CompanyScreen extends HookConsumerWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companies = useState([]);
    final isLoading = useState(true);

    useEffect(() {
      Future.microtask(() => ref.read(companyNotifierProvider.notifier).getAllCompanies());
      return null;
    }, []);

    ref.listen(companyNotifierProvider, (prev, next) {
      next.when(
          error: (error) {
            isLoading.value = false;
          },
          success: (company){
            companies.value = company;
            isLoading.value = false;
          },
          create: (company){
            companies.value = [...companies.value,company];
            isLoading.value = false;
          },
          update: (company){
            final updatedList = companies.value.map((c) {
              return c.uid == company.uid ? company : c;
            }).toList();
            companies.value = updatedList;
            isLoading.value = false;
          },
          delete: (company){
            final updatedList = companies.value.where((c) => c.uid != company.uid).toList();
            companies.value = updatedList;
            isLoading.value = false;
          },
          loading:() {
            isLoading.value = true;
          }, initial: () {  }, loadingForm: () {  });
    });

    return Scaffold(
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          :RefreshIndicator(
        onRefresh: () async {
          await ref.read(companyNotifierProvider.notifier).getAllCompanies();
        },
        child: companies.value.isEmpty
            ? ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(height: 300),
            Center(child: Text('No companies available.')),
          ],
        )
            : ListView.builder(
          itemCount: companies.value.length,
          itemBuilder: (context, index) {
            final company = companies.value[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Theme.of(context).colorScheme.secondary,
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 16),
                  title: Text(company.name),
                  subtitle: Text(company.email),
                  onTap: () {
                    CompanyFormDialog.show(context, uid: company.uid);
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Confirm Deletion'),
                          content: const Text('Are you sure you want to delete ?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                      );

                      if (confirm == true) {
                        await ref
                            .read(companyNotifierProvider.notifier)
                            .deleteCompany(company.uid.toString());
                      }
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'from_company_screen',
        onPressed: () => CompanyFormDialog.show(context),
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.tertiary),
      ),
    );
  }
}
