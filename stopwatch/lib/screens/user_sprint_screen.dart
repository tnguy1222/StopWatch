/*
* Stop Watch version 4.0
* User Sprint Screen version 4.0
* Jim Nguyen
* April 4,2021
* User Sprint Screen
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/providers/sprintService.dart';
import 'package:stopwatch/widgets/nagivation_bar.dart';
import '../widgets/app_drawer.dart';
import 'package:stopwatch/widgets/user_sprint_item.dart';

class UserSprintScreen extends StatefulWidget {
  static const routeName = '/user-sprints';

  @override
  _UserSprintScreenState createState() => _UserSprintScreenState();
}

class _UserSprintScreenState extends State<UserSprintScreen> {
  var _isInit = true;
  var _isLoading = false;
  Future<void> _refreshSprints(BuildContext context) async {
    print("run1111");
    await Provider.of<SprintService>(context).getAllSprints();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("object");
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<SprintService>(context).getAllSprints().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("run 4");
    // Provider.of<SprintService>(context).getAllSprints();
    final sprintsData = Provider.of<SprintService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Completed Sprints'),
      ),
      drawer: AppDrawer(),

      body: RefreshIndicator(
        onRefresh: () => _refreshSprints(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: sprintsData.sprints.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserSprintItem(
                  sprintsData.sprints[i].id,
                  sprintsData.sprints[i].title,
                  sprintsData.sprints[i].duration,
                  sprintsData.sprints[i].dateTime,
                  sprintsData.sprints[i].quote,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: NavigationBar(),
    );
  }
}
