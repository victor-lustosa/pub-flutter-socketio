import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle fonte = GoogleFonts.quantico(
    color: AppColors.white,
    fontSize: 25,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle tabsSelecionadas = GoogleFonts.quantico(
    fontSize: 13,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle tabsNaoSelecionadas = GoogleFonts.quantico(
    fontSize: 13,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle titleHomeApp = GoogleFonts.quantico(
    color: AppColors.white,
    fontSize: 25,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle titleTextField = GoogleFonts.quantico(
    color: Color(0xFFB87333),
    fontSize: 17,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle titleHomeUsuarioBar = GoogleFonts.quantico(
    color: AppColors.white,
    fontSize: 25,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle titleHomeEstabelecimentoBar = GoogleFonts.quantico(
    color: AppColors.white,
    fontSize: 23,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle titleUsuarioEstabelecimento = GoogleFonts.quantico(
    color: AppColors.white,
    fontSize: 15,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle subtitleHomeUsuarioBar = GoogleFonts.quantico(
    color: AppColors.white,
    fontSize: 17,

  );
  static final TextStyle fonteLista = GoogleFonts.quantico(
    color: Color(0xFF964B00),
    fontSize: 18,

  );

  static final TextStyle button = GoogleFonts.quantico(
    color: Color(0xFF422600),
    fontSize: 17,
    // fontWeight: FontWeight.w600,
  );
}