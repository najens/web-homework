import React, { useState } from 'react'
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'
import { css } from '@emotion/core'
import { Home } from './home'
import {
  AppBar,
  Toolbar,
  Typography,
  Tabs,
  Tab
} from '@material-ui/core'

function AppRouter () {
  const [selectedTab, setSelectedTab] = useState(0)

  function handleTabChange (e, val) {
    setSelectedTab(val)
  }
  return (
    <Router>
      <AppBar position='static'>
        <Toolbar>
          <Typography variant='h6'>
            Web Homework
          </Typography>
        </Toolbar>
      </AppBar>
      <Tabs indicatorColor='primary' onChange={handleTabChange} textColor='primary' value={selectedTab}>
        <Tab component={Link} label='Transactions' to='/' />
        <Tab component={Link} label='Stats' to='/stats' />
        <Tab component={Link} label='Users' to='/users' />
      </Tabs>
      <div css={layoutStyle}>
        <div className='main-content' css={contentStyle}>
          <Route component={Home} exact path='/' />
          <Route component={() => (<div>Content for /stats route</div>)} exact path='/stats' />
          <Route component={() => (<div>Content for /users route</div>)} exact path='/users' />
        </div>
      </div>
    </Router>
  )
}

export default AppRouter

const layoutStyle = css`
    display: grid;
    grid-row-gap: 24px;
    padding: 8px;
`

const contentStyle = css`
  grid-row: 2;
`
