import {Component, OnInit, Input, ViewChild} from "@angular/core";
import TableModel from "../data-table/models/table.model";
import CharGroupModel from "../../models/char-group.model";
import {CharGroupService} from "../../services/char-group.service";
import {Router} from "@angular/router";
import {SemanticModalComponent} from "ng-semantic";

@Component({
    selector: 'nc-char-group-list',
    templateUrl: 'char-group-list.component.html',
    styleUrls: ['char-group-list.component.css']
})
export class CharGroupListComponent implements OnInit {
    selectedCharGroup: CharGroupModel;

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

    @ViewChild('modalWindow')
    modalWindow: SemanticModalComponent;

    constructor(private charGroupService: CharGroupService,
                private router: Router) {
    }

    ngOnInit(): void {
        this.charGroupService.getAll()
            .then(charGroups => this.model.data = charGroups);
    }

    onSelect(charGroup: CharGroupModel): void {
        this.selectedCharGroup = charGroup;
    }

    onAddition(): void {
        this.router.navigate(['/char-group-editor', 'addition']);
    }

    onEdit(): void {
        this.router
            .navigate(['/char-group-editor', this.selectedCharGroup.characteristicGroupId]);
    }

    onDelete(): void {
            this.charGroupService
                .deleteGroup(this.selectedCharGroup.characteristicGroupId)
                .then(() => {
                    this.model.data = this.model.data.filter(group => group !== this.selectedCharGroup);
                    this.selectedCharGroup = null;
                })
                .catch(() => {
                    this.modalWindow.show({blurring: true});
                });
    }
}