namespace com.satinfotech.studentdb;
using { managed, cuid } from '@sap/cds/common';

@assert.unique:{
    stdid:[stdid]
}
entity Student: cuid, managed {
    @title: 'Student ID'
    stdid: String(5);
    @title: 'Gender'
    gender: String(1);
    @title: 'First Name'
    first_name: String(40) @mandatory;
    @title: 'Last Name'
    last_name: String(40) @mandatory;
    @title: 'Email ID'
    email_id: String(100) @mandatory;
    @title: 'Date of Birth'
    dob: Date @mandatory;

    // Corrected Composition for Books
    @title: 'Books details'
    Books: Composition of many {
        key ID: UUID;
        @title: 'Book'
        book: Association to Books;
    }

    @title: 'Course'
    course: Association to Courses;
    @title: 'Languages Known'
    Languages: Composition of many {
        key ID: UUID;
        @title: 'Languages'
        lang: Association to Languages;
    }
    @title: 'Age'
    virtual age: Integer @Core.Computed;
}

@cds.persistence.skip
entity Gender {
    @title: 'code'
    key code: String(1);
    @title: 'Description'
    description: String(10);
}

entity Courses : cuid, managed {
    @title: 'Code'
    code: String(3);
    @title: 'Description'
    description: String(50);
}

entity Languages: cuid, managed {
    @title: 'Code'
    code: String(2);
    @title: 'Description'
    description: String(20);
}

entity Books: cuid, managed {
    @title: 'code'
    code: String(10);
    @title: 'description'
    description: String(50);
}
