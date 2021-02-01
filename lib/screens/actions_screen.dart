import 'package:flutter/material.dart';

class ActionsScreen extends StatelessWidget {
  Widget _buildActionWidget(BuildContext ctx, String action, Function func) {
    return InkWell(
      onTap: func,
      splashColor: Colors.black26,
      highlightColor: Colors.indigo[100],
      child: Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                action,
                style: Theme.of(ctx).textTheme.headline1,
              ),
            ),
            Icon(
              Icons.arrow_right,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildActionWidget(context, 'Visit branch', () {
            print('visit branch');
          }),
          _buildActionWidget(context, 'New offering title', () {}),
          _buildActionWidget(context, 'New Expense', () {}),
          _buildActionWidget(context, 'New Branch', () {}),
          _buildActionWidget(context, 'New add new pastor', () {}),
          _buildActionWidget(context, 'Manage Pastor', () {}),
          _buildActionWidget(context, 'Manage Branch', () {}),
        ],
      ),
    );
  }
}
