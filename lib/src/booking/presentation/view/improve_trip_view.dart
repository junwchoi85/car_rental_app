import 'package:car_rental_app/core/common/widgets/nested_back_button.dart';
import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/core/services/injection_container.dart';
import 'package:car_rental_app/core/utils/strings.dart';
import 'package:car_rental_app/src/booking/presentation/bloc/booking_bloc.dart';
import 'package:car_rental_app/src/booking/presentation/view/review_details_view.dart';
import 'package:car_rental_app/src/booking/presentation/widget/rental_option_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImproveTripView extends StatefulWidget {
  const ImproveTripView({super.key});

  @override
  State<ImproveTripView> createState() => _ImproveTripViewState();
}

class _ImproveTripViewState extends State<ImproveTripView> {
  final _snowTilePrice = '9.19';
  final _childSeatPrice = '7.97';
  final _boosterSeatPrice = '7.97';
  final _infantChildSeatPrice = '7.97';

  bool _isSnowTileAdded = false;
  bool _isChildSeatAdded = false;
  bool _isBoosterSeatAdded = false;
  bool _isInfantChildSeatAdded = false;

  void _toggleSnowTile(bool val) {
    setState(() {
      _isSnowTileAdded = val;
    });
  }

  void _toggleChildSeat(bool val) {
    setState(() {
      _isChildSeatAdded = val;
    });
  }

  void _toggleBoosterSeat(bool val) {
    setState(() {
      _isBoosterSeatAdded = val;
    });
  }

  void _toggleInfantChildSeat(bool val) {
    setState(() {
      _isInfantChildSeatAdded = val;
    });
  }

  bool _isOptionAdded() {
    if (_isSnowTileAdded ||
        _isChildSeatAdded ||
        _isBoosterSeatAdded ||
        _isInfantChildSeatAdded) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const NestedBackButton(),
        title: const Text('Improve Trip'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Strings.rentalExtrasSectionTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              RentalOptionTiles(
                title: Strings.snowTireTitle,
                description: Strings.snowTireDescription,
                price: _snowTilePrice,
                isAdded: _isSnowTileAdded,
                onChanged: _toggleSnowTile,
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Strings.childSeatSectionTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              RentalOptionTiles(
                title: Strings.childSeatTitle,
                description: Strings.childSeatDescription,
                price: _childSeatPrice,
                isAdded: _isChildSeatAdded,
                onChanged: _toggleChildSeat,
              ),
              const SizedBox(height: 6),
              RentalOptionTiles(
                title: Strings.boosterSeatTitle,
                description: Strings.boosterSeatDescription,
                price: _boosterSeatPrice,
                isAdded: _isBoosterSeatAdded,
                onChanged: _toggleBoosterSeat,
              ),
              const SizedBox(height: 6),
              RentalOptionTiles(
                title: Strings.infantChildSeatTitle,
                description: Strings.infantChildSeatDescription,
                price: _infantChildSeatPrice,
                isAdded: _isInfantChildSeatAdded,
                onChanged: _toggleInfantChildSeat,
              ),
              Visibility(
                visible: _isOptionAdded(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.theme.primaryColor,
                        foregroundColor: context.theme.colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        context.push(const ReviewDetailsView());
                      },
                      child: const Text(
                        'Continue',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !_isOptionAdded(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.theme.primaryColor,
                        foregroundColor: context.theme.colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        context
                            .read<BookingBloc>()
                            .add(const ChooseOptionsEvent());
                        context.push(const ReviewDetailsView());
                      },
                      child: const Text(
                        'No. Thank you.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
