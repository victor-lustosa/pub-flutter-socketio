import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle fonte = GoogleFonts.inter(
    color: AppColors.white,
    fontSize: 25,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle tabsSelecionadas = GoogleFonts.inter(
    fontSize: 13,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle tabsNaoSelecionadas = GoogleFonts.inter(
    fontSize: 13,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle titleHomeApp = GoogleFonts.inter(
    color: AppColors.white,
    fontSize: 25,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle titleTextField = GoogleFonts.inter(
    color: AppColors.marromClaro,
    fontSize: 17,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle fonteLista = GoogleFonts.inter(
    color: AppColors.marrom,
    fontSize: 18,
  );
  static final TextStyle button = GoogleFonts.inter(
    color: AppColors.marromEscuro,
    fontSize: 17,
    // fontWeight: FontWeight.w600,
  );
}