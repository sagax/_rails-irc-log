$(document).ready =>
  $('#tz').change ->
    document.location.href += "?tz=" + this.value
    return
  return
