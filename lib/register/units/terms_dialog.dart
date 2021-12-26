part of '../view.dart';

_showTermsDialog(BuildContext context) {
  final cubit = RegisterCubit.of(context);
  showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => _Dialog(cubit),
  );
}

class _Dialog extends StatelessWidget {
  final RegisterCubit cubit;
  _Dialog(this.cubit);
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Terms & Conditions'),
      content: Text('Bla ' * 8),
      actions: [
        CupertinoButton(
          child: Text('Accept'),
          onPressed: () {
            cubit.toggleTerms(true);
            Navigator.pop(context);
          },
        ),
        CupertinoButton(
          child: Text('Refuse'),
          color: Colors.red,
          onPressed: () {
            cubit.toggleTerms(false);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
