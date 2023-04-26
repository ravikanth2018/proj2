namespace ravi.com;

using {cuid, managed, temporal, Currency} from '@sap/cds/common';

context tran {
    entity notif : cuid, managed {
        notif_no: Integer;
        desc: String(40);
        start_date: Date default new Date();
        notif_type: String(2) enum {
            egi = 'AI';
            ser = 'AS';
        };
        items: Composition of many equip on items.parent = $self
    }

    entity  equip : cuid, managed {
        parent: Association to notif;
        equip_no: Integer;
        equip_desc: String(40);
    }

}


