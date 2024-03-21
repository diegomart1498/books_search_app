import 'dart:async';
import 'package:books_search_app/src/configs/text_style_config.dart/text_style_ext.dart';
import 'package:books_search_app/src/configs/toast_config/toast.dart';
import 'package:books_search_app/src/configs/ui_constants_config/duration_constants.dart';
import 'package:books_search_app/src/configs/utilities/package.dart';
import 'package:books_search_app/src/feature/details/package.dart';
import 'package:books_search_app/src/repository/books_repository.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../configs/ui_constants_config/ui/ui.dart';
import '../../shared/package.dart';
import '../details/models/book_details.dart';
import 'models/new_books_response_model.dart';

part 'views/home_page.dart';
part 'widgets/book_card_shimmer.dart';
part 'widgets/book_card_swiper.dart';
part 'widgets/book_card.dart';
part 'widgets/book_price_tag.dart';
part 'widgets/book_search_delegate.dart';
part 'widgets/book_search_results.dart';
part 'widgets/home_page_body.dart';
part 'provider/book_provider.dart';
