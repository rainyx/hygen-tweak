// see types of prompts:
// https://github.com/enquirer/enquirer/tree/master/examples
//
module.exports = [
  {
    type: 'input',
    name: 'projectName',
    message: "Project Name (required)"
  },
  {
    type: 'input',
    name: 'packageName',
    message: "Package Name [com.yourcompany.test]",
    initial: "com.yourcompany.test"
  },
  {
    type: 'input',
    name: 'authorName',
    message: "Author/Maintainer Name [admin]",
    initial: "admin"
  },
  {
    type: 'input',
    name: 'bundleFilter',
    message: "[iphone/tweak] MobileSubstrate Bundle filter [com.apple.springboard]",
    initial: "com.apple.springboard"
  },
  {
    type: 'input',
    name: 'killsPostInstall',
    message: "[iphone/tweak] List of applications to terminate upon installation (space-separated, '-' for none) [SpringBoard]",
    initial: "SpringBoard"
  }
]
