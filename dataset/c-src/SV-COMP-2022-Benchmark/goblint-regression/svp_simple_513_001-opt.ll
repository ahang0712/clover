; ModuleID = 'svp_simple_513_001-opt.bc'
source_filename = "./svp_simple_513_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@glob = common global i32 0, align 4
@.str = private unnamed_addr constant [22 x i8] c"Now we do the work..n\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Work is completed...\00", align 1

; Function Attrs: nounwind uwtable
define void @svp_simple_513_001_isr_1(i8* %0) #0 !dbg !7 {
  %2 = load i32, i32* @glob, align 4, !dbg !10, !tbaa !11
  %3 = add nsw i32 %2, 1, !dbg !10
  store i32 %3, i32* @glob, align 4, !dbg !10, !tbaa !11
  ret void, !dbg !15
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_513_001_main() #0 !dbg !16 {
  %1 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !17
  %2 = icmp ne i32 %1, 0, !dbg !18
  br i1 %2, label %3, label %5, !dbg !18

3:                                                ; preds = %0
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0)), !dbg !19
  br label %5, !dbg !19

5:                                                ; preds = %3, %0
  %6 = icmp ne i32 %1, 0, !dbg !20
  br i1 %6, label %7, label %10, !dbg !20

7:                                                ; preds = %5
  %8 = load i32, i32* @glob, align 4, !dbg !21, !tbaa !11
  %9 = add nsw i32 %8, 1, !dbg !21
  store i32 %9, i32* @glob, align 4, !dbg !21, !tbaa !11
  br label %10, !dbg !22

10:                                               ; preds = %7, %5
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0)), !dbg !23
  ret i32 0, !dbg !24
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare i32 @__VERIFIER_nondet_int(...) #2

declare i32 @printf(i8*, ...) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_513_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_513_001_isr_1", scope: !8, file: !8, line: 7, type: !9, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_513_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 9, column: 7, scope: !7)
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !DILocation(line: 11, column: 1, scope: !7)
!16 = distinct !DISubprogram(name: "svp_simple_513_001_main", scope: !8, file: !8, line: 13, type: !9, scopeLine: 13, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!17 = !DILocation(line: 14, column: 11, scope: !16)
!18 = !DILocation(line: 16, column: 7, scope: !16)
!19 = !DILocation(line: 17, column: 3, scope: !16)
!20 = !DILocation(line: 18, column: 7, scope: !16)
!21 = !DILocation(line: 19, column: 9, scope: !16)
!22 = !DILocation(line: 19, column: 5, scope: !16)
!23 = !DILocation(line: 20, column: 3, scope: !16)
!24 = !DILocation(line: 22, column: 3, scope: !16)
