import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../src.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  void initState() {
    super.initState();
    Misc.onLayoutRendered(() {
      context.read<TeamProvider>().fetchTeamMembers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Consumer<TeamProvider>(
        builder: (context, provider, child) {
          if (provider.status == DataFetchStatus.loading) {
            return const CustomLoader();
          } else if (provider.status == DataFetchStatus.success &&
              provider.teamMembers.isEmpty) {
            return const NoDataWidget(
              title: 'No Team Members',
              description: 'No team members are available at the moment.',
            );
          } else if (provider.status == DataFetchStatus.error) {
            return const Center(child: Text('Failed to show data'));
          }

          return ListView.builder(
            itemCount: provider.teamMembers.length,
            itemBuilder: (context, index) {
              final member = provider.teamMembers[index];
              return TeamCard(member: member);
            },
          );
        },
      ),
    );
  }
}
