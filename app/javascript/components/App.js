import React from 'react'
import { Switch, Route, Linkk } from 'react-router-dom'
import styled from 'styled-components'
import AddTodo from './AddTodo'
import TodoList from './TodoList'
import EditTodo from './EditTodo'
import './App.css'

const Navbar = styled.nav`
  background: #dbfffe;
  min-height: 8vh;
  display: flex;
  justify-content: center;
  aligin-items: center;
`

const Logo = styled.div`
  font-weight: bold;
  font-size: 23px;
  letter-spacing: 3px;
`

const NavItems = styled.ul`
  display: flex;
  width: 400px;
  max-width: 40%;
  justify-content: space-around;
  list-style: none;
`

const NavItem = styled.li`
  font-size: 19px;
  font-weight: bold;
  opacity: 0.7;
  &:hover {
    opacity: 1;
  }
`

const Wrapper = styled.div`
  width: 700px;
  max-width: 85%;
  margin: 20px auto;
`

function App() {
  return (
    <>
    <Navbar>
      <Logo>
        TODO
      </Logo>
      <NavItems>
        <NavItem>
          <Link to="/todos">
            Todos
          </Link>
        </NavItem>
        <NavItem>
          <Link to="/todos/new">
            Add New Todo
          </Link>
        </NavItem>
      </NavItems>
    </Navbar>
    <Wrapper>
      <Switch>
        <Route exact path="/todos" component={TodoList} />
        <Route exact path="/todos/new" component={AddTodo} />
        <Route exact path="/todos_:id_edit" component={EditTodo} />
      </Switch>
    </Wrapper>
    </>
  )
}

export default App
