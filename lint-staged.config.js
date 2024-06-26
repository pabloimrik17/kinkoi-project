// This limit is only for lint-staged files, not for the whole project
const ESLINT_MAX_WARNINGS = 10;

module.exports = {
    "**/*": "prettier --write --ignore-unknown",
    // "*.{tsx,ts}": [`eslint --fix --max-warnings ${ESLINT_MAX_WARNINGS}`],
    // "*.{tsx,ts}": (fileNames) => [
    //     `eslint --fix --max-warnings ${ESLINT_MAX_WARNINGS}`,
    //     // `prettier ${fileNames.join(" ")} --write --ignore-unknown`,
    // ],
    // "*.css": "stylelint --fix",
    // "*.scss": "stylelint --fix",
};
