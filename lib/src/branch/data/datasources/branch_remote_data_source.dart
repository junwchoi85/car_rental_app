import 'package:car_rental_app/src/branch/data/models/branch_model.dart';

abstract class BranchRemoteDataSource {
  /// Fetches the list of branches from the remote API.
  Future<List<BranchModel>> getBranchList();
}

class BranchRemoteDataSourceImpl implements BranchRemoteDataSource {
  @override
  Future<List<BranchModel>> getBranchList() {
    const supportEmail = 'support@classiccrew.io';
    final List<BranchModel> branchList = [
      const BranchModel(
        branchCode: 'B001',
        name: 'Auckland Airport',
        address: 'Andrew Mckee Avenue, Auckland Airport, Auckland 2022',
        phone: '00 000 0000',
        email: supportEmail,
      ),
      const BranchModel(
        branchCode: 'B002',
        name: 'Auckland Downtown',
        address: '154 Victoria Street West, Auckland Central, Auckland 1010',
        phone: '00 000 0000',
        email: supportEmail,
      ),
      const BranchModel(
        branchCode: 'B003',
        name: 'Auckland East',
        address: '61 A Feltom Street, Glen Innes, Auckland 1072',
        phone: '00 000 0000',
        email: supportEmail,
      ),
      const BranchModel(
        branchCode: 'B004',
        name: 'Auckland Northshore',
        address: '37 Northcote Road, Northcote, Auckland 0627',
        phone: '00 000 0000',
        email: supportEmail,
      ),
      const BranchModel(
        branchCode: 'B005',
        name: 'Auckland South',
        address: '1/1 Great South Road, Otahuhu, Auckland 1062',
        phone: '00 000 0000',
        email: supportEmail,
      ),
      const BranchModel(
        branchCode: 'B006',
        name: 'Auckland West',
        address: '1/1 Hobsonville Road, Hobsonville, Auckland 0618',
        phone: '00 000 0000',
        email: supportEmail,
      ),
      const BranchModel(
        branchCode: 'B007',
        name: 'Auckland West',
        address: '1/1 Hobsonville Road, Hobsonville, Auckland 0618',
        phone: '00 000 0000',
        email: supportEmail,
      ),
    ];

    return Future.value(branchList);
  }
}
