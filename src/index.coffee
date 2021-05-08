_try = (func)=>
  try
    return await func()
  catch err
    console.error(err)

export class Cron
  constructor:(@interval, @delay)->
    @job = []

  run:->
    {interval} = @
    for i from @job
      i[0] -= interval
      if i[0] <= 0
        i[0]=i[1]
        _try i[2]
    return


  add:->
    @timer = setInterval(
      @run.bind(@)
      @interval*1000
    )

    add = (interval, job, delay)->
      if delay == undefined
        {delay} = @
      interval = interval * @interval
      setTimeout(
        =>
          _try job
        delay*1000
      )
      @job.push [interval+delay, interval, job]

    @add = add.bind(@)
    add.apply @, arguments

MCron = new Cron(60, 3)
HCron = new Cron(3600, 30)
DCron = new Cron(3600*24, 60)

export mcron = MCron.add.bind(MCron)
export hcron = HCron.add.bind(HCron)
export dcron = DCron.add.bind(DCron)


