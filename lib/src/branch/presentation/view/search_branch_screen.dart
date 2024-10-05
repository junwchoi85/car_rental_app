import 'package:car_rental_app/core/common/widgets/nested_back_button.dart';
import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/src/branch/presentation/bloc/branch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBranchScreen extends StatefulWidget {
  const SearchBranchScreen({
    super.key,
    required this.serviceType,
    this.initialBranch,
  });
  final String serviceType;
  final String? initialBranch;
  static const routeName = '/search-branch';

  @override
  State<SearchBranchScreen> createState() => _SearchBranchScreenState();
}

class _SearchBranchScreenState extends State<SearchBranchScreen> {
  // Sample data for search
  final List<String> _allItems = [];
  List<String> _filteredItems = [];
  late TextEditingController _branchController;

  @override
  void initState() {
    super.initState();
    _branchController = TextEditingController();
    context.read<BranchBloc>().add(const LoadBranchesEvent());
  }

  @override
  void dispose() {
    _branchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BranchBloc, BranchState>(
      listener: (context, state) {
        if (state is BranchLoaded) {
          setState(() {
            _allItems.clear();
            _allItems.addAll(state.branches.map((branch) => branch.name));
            _filteredItems = _allItems
                .where((item) => item
                    .toLowerCase()
                    .contains(_branchController.text.toLowerCase()))
                .toList();
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const NestedBackButton(),
            title: const Text('Branch Location'),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('cancel'),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search TextField
                TextField(
                  controller: _branchController,
                  decoration: InputDecoration(
                    labelText: 'Select a ${widget.serviceType} location',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                // Dropdown-like display of filtered results
                _filteredItems.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: _filteredItems.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_filteredItems[index]),
                              onTap: () {
                                _branchController.text = _filteredItems[index];
                                // Optionally clear the search results
                                setState(() {
                                  _filteredItems.clear();
                                });
                              },
                            );
                          },
                        ),
                      )
                    : Container(), // Show nothing if no matching items
                const Spacer(),
                // add a button at the bottom to select the selected branch
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _branchController.text.isNotEmpty
                        ? () {
                            final selectedBranch = (context
                                    .read<BranchBloc>()
                                    .state as BranchLoaded)
                                .branches
                                .firstWhere((branch) =>
                                    branch.name == _branchController.text);
                            final bloc = context.read<BranchBloc>();
                            bloc.add(SelectBranchEvent(
                              branch: selectedBranch,
                            ));
                            // Handle the branch selection
                            context.popWithData(selectedBranch);
                          }
                        : null,
                    child: const Text('Select Branch'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
