import 'dart:io';

import 'package:books_search_app/src/configs/toast_config/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:logger/logger.dart';
import 'package:recase/recase.dart';

import '../input_formatter_config/input_formatter_config.dart';

part 'enums/input_formatter_enum.dart';
part 'extensions/form_builder_state_ext.dart';
part 'extensions/string_ext.dart';
part 'form_validators_utility.dart';
part 'http_exception_override.dart';
part 'internet_connection_checker.dart';
part 'logger_utility.dart';
part 'page_transition_utility.dart';
