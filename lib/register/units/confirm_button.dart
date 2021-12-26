part of '../view.dart';

class _ConfirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => ElevatedButton(
        onPressed: cubit.isTermsAccepted ? () {} : null,
        child: Text('Register'),
      ),
    );
  }
}
