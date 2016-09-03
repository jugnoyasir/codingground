#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
   int N =0;
   
   scanf("%d",&N);
   NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
   int nC=0;
    for(nC=0;nC<N;nC++){
       char name[100] ;
       scanf("%s",name);
       NSString* str = [NSString stringWithUTF8String:name];
       NSNumber* kNum =[dictionary objectForKey:str];
       if(kNum){
            int iN = [kNum intValue];
            iN = iN+1;
            kNum = [NSNumber numberWithInt:iN];
            [dictionary removeObjectForKey:str];
       }else{
            kNum = [NSNumber numberWithInt:1 ];
       }
       
       [dictionary setObject:kNum forKey:str];
    }
   
    NSString *maxT;
    int maxI=1;
    for (id key in dictionary ){
        
        NSNumber *timeNS = [dictionary objectForKey:key];
     
        int times = [timeNS intValue];
        if(maxI < times){
            maxI = times;
            maxT = key;
        }
    }
   
   NSLog(@"String %@ times %d",maxT,maxI);
    [dictionary release]; 
   [pool drain];
   return 0;
}
