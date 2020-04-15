import os

# Use qutewal to apply pywal themes
config.source('qutewal.py')

# Set the font-setting of the browser
c.fonts.default_size='12px'
c.fonts.default_family=['Source Code Pro Semibold']

# Define some custom stylesheets if they exist
stylesheets = [os.path.join(os.getenv("HOME"),
                            'Repos',
                            'wal-related',
                            'solarized-everything-css',
                            'css',
                            'solarized-dark',
                            'solarized-dark-all-sites.css')] 

# Apply if exists
if all(os.path.exists(sheet) for sheet in stylesheets):
    c.content.user_stylesheets = stylesheets
