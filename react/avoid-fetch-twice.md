# How to avoid fetch twice in useEffect

use AbortController and clean up function

```js
import { useState } from "react"
import { useEffect } from "react"

export const FetchDemo = () => {
  const [users, setUsers] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState()
  // https://jsonplaceholder.typicode.com/users
  useEffect(() => {
    setLoading(true)
    setError(undefined)
    const controller = new AbortController()
    fetch("https://jsonplaceholder.typicode.com/users", {
      signal: controller.signal,
    })
      .then((response) => {
        if (response.ok) {
          return response.json()
        } else {
          return Promise.reject(response)
        }
      })
      .then((users) => {
        console.log("here")
        setUsers(users)
      })
      .catch((e) => {
        if (e?.name === "AbortError") return
        setError(e)
      })
      .finally(() => {
        setLoading(false)
      })

    return () => {
      controller.abort()
    }
  }, [])

  let jsx
  if (loading) {
    jsx = <h2>loading...</h2>
  } else if (error != null) {
    jsx = <h2>error</h2>
  } else {
    jsx = (
      <ul>
        {users.map((user) => (
          <li key={user.id}>{user.name}</li>
        ))}
      </ul>
    )
  }
  return (
    <div>
      <h1>Users</h1>
      <ul>{jsx}</ul>
    </div>
  )
}
```
