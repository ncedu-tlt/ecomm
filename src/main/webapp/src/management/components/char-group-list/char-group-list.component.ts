import {Component, OnInit, Input} from '@angular/core';
import TableModel from "../data-table/models/table.model";
import CharGroupModel from "../../models/char-group.model";
import {CharGroupService} from "../../services/char-group.service";
import {Router} from "@angular/router";

@Component({
    selector: 'nc-char-group-list',
    templateUrl: 'char-group-list.component.html',
    styleUrls: ['char-group-list.component.css']
})
export class CharGroupListComponent implements OnInit {
    charGroupModel: CharGroupModel;

    @Input() model: TableModel = {
        data: [],
        columns: [
            {
                name: 'ID',
                key: 'characteristicGroupId'
            },
            {
                name: 'Name',
                key: 'characteristicGroupName'
            }
        ]
    };

    constructor(private charGroupService: CharGroupService,
                private router: Router) {
    }

    ngOnInit(): void {
        this.charGroupService.getCharacteristicGroups()
            .then(charGroups => this.model.data = charGroups);
    }

    onSelect(charGroup: CharGroupModel): void {
        this.charGroupModel = charGroup;
    }

    onAddition(): void {
        // if (!groupName.trim()) return;
        // this.charGroupService
        //     .addCharacteristicGroup(groupName)
        //     .then(group => {
        //         this.model.data.push(group);
        //     })
    }

    onEdit(): void {
        if (this.charGroupModel) {
            console.log(this.charGroupModel.characteristicGroupName + ' edited');
        }
    }

    onDelete(): void {
        if (this.charGroupModel) {
            this.charGroupService
                .deleteCharacteristicGroup(this.charGroupModel.characteristicGroupId)
                .then(() => {
                    this.model.data = this.model.data.filter(group => group !== this.charGroupModel);
                    this.charGroupModel = null;
                });
        }
    }
}
