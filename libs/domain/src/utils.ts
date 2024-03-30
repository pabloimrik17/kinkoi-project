export class DomainMain {
    constructor() {
        console.log('DomainMain');
    }
}

export const domainMainInit = (): DomainMain => {
    return new DomainMain()
}
