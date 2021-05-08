export class Cron
  constructor:(@interval)->
    @job = []
    @timer = setInterval(
      @run
      @interval
    )

  run:->
    console.log @job

  add:(interval, job, now=true)->
    if now
      job()
    @job.push [interval, job, interval]

MCron = new Cron(6000)

export default MCron.add.bind(MCron)


