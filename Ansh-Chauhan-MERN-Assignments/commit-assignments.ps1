# Run this script from inside your own cloned GitHub repository after copying
# the assignment folders and assets into that repository.
$ErrorActionPreference = 'Stop'
if (-not (Test-Path '.git')) { git init }
if (-not (git config user.name)) { Write-Host 'Set your Git name first: git config user.name "Your Name"'; exit 1 }
if (-not (git config user.email)) { Write-Host 'Set your Git email first: git config user.email "you@example.com"'; exit 1 }

# Root project guide
if (Test-Path 'README.md') {
  git add -- 'README.md'
  git commit -m 'Add project overview and submission checklist'
}

$folders = @(
 'Assignment 1 - Personal Portfolio',
 'Assignment 2 - HTML Forms',
 'Assignment 3 - Complex Table',
 'Assignment 4 - Styled Portfolio',
 'Assignment 5 - Business Landing Page',
 'Assignment 6 - Flexbox Layouts',
 'Assignment 7 - CSS Grid',
 'Assignment 8 - Responsive Audit'
)
foreach ($folder in $folders) {
  if (-not (Test-Path $folder)) { throw "Missing folder: $folder" }
  git add -- "$folder/README.md"
  git commit -m "Document $folder requirements and learning notes"

  git add -- "$folder/*.html"
  git commit -m "Build HTML pages for $folder"

  if ($folder.StartsWith('Assignment 1')) {
    git add -- 'assets/'
    git commit -m 'Add accessible portfolio illustration assets'
  } else {
    git add -- "$folder/*.css"
    git commit -m "Style and refine layouts for $folder"
  }
}
Write-Host 'Created three meaningful commits per assignment. Review them with: git log --oneline'
