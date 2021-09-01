export const userSchema = {
  id: { type: "number" },
  name: { type: "string" },
  pass: { type: "string" },
  email: { type: "string", format: "uri" },
  created_at: { type: "string", format: "date-time" },
  updated_at: { type: "string", format: "date-time" }
}

export const registerUserSchema = {
  summary: "register user",
  description: "register",
  params: {
    type: "object",
    //required: ["name", "image", "expires_in", "unit"],
    properties: {
      name: { type: "string" },
      pass: { type: "string" },
      email: { type: "string", format: "uri" },
    }
  },
  response: {
    200: {
      type: "boolean"
    }
  }
}

export const getUserSchema = {
  summary: "get user",
  description: "get user",
  params: {
    type: "object",
    required: ["id"],
    properties: {
      id: { type: "number" }
    }
  },
  response: {
    200: {
      type: "objec",
      properties: userSchema
    }
  }
}

export const loginUserSchema = {
  summary: "login user",
  description: "login user",
  params: {
    type: "object",
    required: ["email"],
    properties: {
      email: { type: "string" }
    }
  },
  response: {
    200: {
      type: "objec",
      properties: userSchema
    }
  }
}
