export default (func, args...)=>
  try
    return await func(...args)
  catch err
    console.error(err)
