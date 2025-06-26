; ModuleID = 'svp_simple_518_001-opt.bc'
source_filename = "./svp_simple_518_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@myglobal = common global i32 0, align 4
@.str = private unnamed_addr constant [20 x i8] c"myglobal equals %dn\00", align 1

; Function Attrs: nounwind uwtable
define void @svp_simple_518_001_isr_1(i8* %0) #0 !dbg !7 {
  %2 = load i32, i32* @myglobal, align 4, !dbg !10, !tbaa !11
  %3 = add nsw i32 %2, 1, !dbg !15
  store i32 %3, i32* @myglobal, align 4, !dbg !16, !tbaa !11
  ret void, !dbg !17
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @add1(i32 %0) #0 !dbg !18 {
  %2 = add nsw i32 %0, 1, !dbg !19
  ret i32 %2, !dbg !20
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_518_001_main() #0 !dbg !21 {
  %1 = load i32, i32* @myglobal, align 4, !dbg !22, !tbaa !11
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), i32 %1), !dbg !23
  %3 = load i32, i32* @myglobal, align 4, !dbg !24, !tbaa !11
  %4 = add nsw i32 %3, 1, !dbg !25
  ret i32 0, !dbg !27
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_518_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_518_001_isr_1", scope: !8, file: !8, line: 7, type: !9, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_518_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 8, column: 13, scope: !7)
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !DILocation(line: 8, column: 21, scope: !7)
!16 = !DILocation(line: 9, column: 12, scope: !7)
!17 = !DILocation(line: 12, column: 1, scope: !7)
!18 = distinct !DISubprogram(name: "add1", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!19 = !DILocation(line: 15, column: 11, scope: !18)
!20 = !DILocation(line: 15, column: 3, scope: !18)
!21 = distinct !DISubprogram(name: "svp_simple_518_001_main", scope: !8, file: !8, line: 18, type: !9, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!22 = !DILocation(line: 19, column: 32, scope: !21)
!23 = !DILocation(line: 19, column: 3, scope: !21)
!24 = !DILocation(line: 21, column: 8, scope: !21)
!25 = !DILocation(line: 15, column: 11, scope: !18, inlinedAt: !26)
!26 = distinct !DILocation(line: 21, column: 3, scope: !21)
!27 = !DILocation(line: 23, column: 3, scope: !21)
