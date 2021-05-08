export class Cron
  constructor:(@interval)->
    @job = []
    @timer = setInterval(
      @run.bind(@)
      @interval
    )

  run:->
    console.log @job

  add:(interval, job, now=true)->
    if now
      job()
    @job.push [interval, job, interval]

MCron = new Cron(6000)
HCron = new Cron(3600000)
DCron = new Cron(3600000*24)

export mcron = MCron.add.bind(MCron)
export hcron = HCron.add.bind(HCron)
export dcron = DCron.add.bind(DCron)


