myCredit = require('./credit.js')
# import SELF LIB
scraper = require('./dist/scraper')
extractor = require('./dist/extractor')

cheerio = require('cheerio')
commander = require('commander')
ora = require('ora')
kode_boking = undefined
# "Z55EJ8"
myCredit()
spinner = ora('Fetching Data ... ')
spinner.color = 'blue'
spinner.start()

main = ->
  commander.version('v1.0.1').option('-c, --code [booking_code]', 'Booking Code').parse process.argv
  if commander.code
    scrap = await scraper(commander.code)
    spinner.succeed 'Successfully fetching data'
    ext = extractor.load(scrap)
    spinner.succeed 'Finish extracting data \n'
    console.log ext[0]
    console.log ext[1]
  else
    console.log 'You must input Booking Code'
  return

main()

# ---
# generated by Ayat Maulana - 2018