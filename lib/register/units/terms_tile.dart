part of "../view.dart";

class _TermsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return Row(
      children: [
        Text('Accept'),
        TextButton(
          onPressed: () => _showTermsDialog(context),
          child: Text('Terms & Conditions'),
        ),
        Spacer(),
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) => Checkbox(
            value: cubit.isTermsAccepted,
            onChanged: (v) => cubit.toggleTerms(v!),
          ),
        ),
      ],
    );
  }
}
