import 'package:app/core/router/routes.dart';
import 'package:app/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

// class BudgetsPage extends ConsumerWidget {
//   const BudgetsPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(budgetsControllerProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ter'),
//         centerTitle: true,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text('Drawer Header'),
//             ),
//             ListTile(
//               title: const Text('Item 1'),
//               onTap: () {},
//             ),
//             ListTile(
//               title: const Text('Item 2'),
//               onTap: () {
//                 // Update the state of the app.
//                 // ...
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: state.when(
//           data: (data) => ListView.builder(
//             itemCount: state.value!.length,
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(
//                 title: Text(state.value![index].id),
//                 onTap: () => BudgetRoute(state.value![index].id).go(context),
//               );
//             },
//           ),
//           error: (error, stacktrace) {
//             print(error);
//           },
//           loading: CircularProgressIndicator.new,
//         ),
//       ),
//     );
//   }
// }

class BudgetsPage extends StatelessWidget {
  const BudgetsPage({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Budgets')),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I*a*eMoney',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.all_inclusive),
              title: Text(L.of(context).drawer_item_budgets_all),
              onTap: () => const BudgetsListRoute().go(context),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: IntrinsicWidth(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(L.of(context).drawer_button_budget_add)),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
