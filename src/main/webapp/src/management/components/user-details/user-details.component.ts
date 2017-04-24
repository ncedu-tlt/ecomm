import "rxjs/add/operator/switchMap";
import {Component, OnInit} from "@angular/core";
import {ActivatedRoute, Params} from "@angular/router";
import UserModel from "../../models/user.model";
import {UsersService} from "../../services/users.service";

@Component({
    selector: 'nc-user-details',
    templateUrl: 'user-details.component.html'
})
export class UserDetailsComponent implements OnInit {

    user: UserModel;

    constructor(
        private usersService: UsersService,
        private route: ActivatedRoute
    ) { }

    ngOnInit(): void {
        this.route.params
            .switchMap((params: Params) => this.usersService.getUser(+params['id']))
            .subscribe(user => this.user = user);
    }
}