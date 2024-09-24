// A helper to sanitize form input, be sure to call whenever a form is recieved.

function sanitize(body) {
  for (let element in body) body[element] = xss(body[element]);
  return body;
}

function checkNull(input) {
  if (!input && input != 0 && input != false)
    throw "Error: Input is not supplied, is undefined, null, '', or NaN";
}
