import React, {Component} from 'react';
import {
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink
} from 'reactstrap';

class Navigation extends Component {
  constructor (props) {
    super(props);

    this.state = {
      isOpen: false
    };
    this.toggle = this.toggle.bind(this);
  }

  toggle () {
    this.setState({isOpen: !this.state.isOpen})
  }

  render () {
    return (
      <Navbar color="primary" dark expand="md">
        <NavbarBrand href="/">Awesome Answers</NavbarBrand>
        <NavbarToggler onClick={this.toggle}/>

        <Collapse isOpen={this.state.isOpen} navbar>
          <Nav navbar>
            <NavItem>
              <NavLink href="/">Home</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/questions/new">New Question</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/questions">Questions</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/session/new">Sign In</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/users/new">Sign Up</NavLink>
            </NavItem>
          </Nav>
        </Collapse>
      </Navbar>
    );
  }
}

export {Navigation};
