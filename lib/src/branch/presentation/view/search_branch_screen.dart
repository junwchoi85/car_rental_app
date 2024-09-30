import 'package:car_rental_app/src/branch/presentation/bloc/branch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBranchScreen extends StatefulWidget {
  const SearchBranchScreen({super.key});

  static const String routeName = '/search-branch';

  @override
  State<SearchBranchScreen> createState() => _SearchBranchScreenState();
}

class _SearchBranchScreenState extends State<SearchBranchScreen> {
  // Sample data for search
  final List<String> _allItems = [];
  List<String> _filteredItems = [];

  // Controller to capture user input
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearchChanged);
    _controller.dispose();
    super.dispose();
  }

  // Function to handle the input change
  void _onSearchChanged() {
    setState(() {
      _filteredItems = _allItems
          .where((item) =>
              item.toLowerCase().contains(_controller.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<BranchBloc>().add(const LoadBranchesEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a pick-up location'),
      ),
      body: BlocConsumer<BranchBloc, BranchState>(
        listener: (context, state) {
          if (state is BranchLoaded) {
            setState(() {
              _allItems.clear();
              _allItems.addAll(state.branches.map((branch) => branch.name));
              _filteredItems = _allItems
                  .where((item) => item
                      .toLowerCase()
                      .contains(_controller.text.toLowerCase()))
                  .toList();
            });
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search TextField
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
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
                                // Do something when an item is tapped
                                print('Selected: ${_filteredItems[index]}');
                                _controller.text = _filteredItems[index];
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
              ],
            ),
          );
        },
      ),
    );
  }
}
