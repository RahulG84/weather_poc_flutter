set -e
function generateCoverage {
  echo "Generating test coverage"
  flutter test --coverage
  (cd coverage; sed -i '' "s|SF:lib/|SF:lib/|g" lcov.info)
  mkdir -p combined_coverage
  touch combined_coverage/combined-coverage.info

  echo "Combining all coverage into file://$(pwd)/combined_coverage/combined-coverage.info"
  lcov --add-tracefile coverage/lcov.info --base-directory lib --no-external \
       --output-file combined_coverage/combined-coverage.info
  echo "Generating html file test coverage"
  genhtml combined_coverage/combined-coverage.info --output-directory combined_coverage/html --show-details
  echo "Open this file file://$(pwd)/combined_coverage/html/index.html"
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  if command -v lcov >/dev/null 2>&1; then
    generateCoverage
  else
    echo "lcov is not installed in mac"
    echo "Installing lcov using this command 'brew install lcov'"
    brew install lcov
    generateCoverage
  fi
elif [[ "$OSTYPE" == "msys" ]]; then
  if where lcov >/dev/null 2>&1; then
    generateCoverage
  else
    echo "lcov is not installed in windows"
    echo "Please refer to the following link for more information: https://github.com/linux-test-project/lcov."
  fi
else
  echo "Unknown operating system"
fi