#!/bin/bash
set -e
pandoc privacy_statement_en.md -o privacy_statement_en.html
pandoc privacy_statement_de.md -o privacy_statement_de.html
pandoc legal_en.md -o legal_en.html
pandoc legal_de.md -o legal_de.html

exit 0