local rainbow_delimiters = require('rainbow-delimiters')

return {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'rainbowcol1',
        'rainbowcol2',
        'rainbowcol3',
    },
}

