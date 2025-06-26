; ModuleID = 'svp_simple_560_001-opt.bc'
source_filename = "./svp_simple_560_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@data = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @assume_abort_if_not(i32 %0) #0 !dbg !7 {
  %2 = icmp ne i32 %0, 0, !dbg !10
  br i1 %2, label %4, label %3, !dbg !11

3:                                                ; preds = %1
  call void @abort() #4, !dbg !12
  unreachable, !dbg !12

4:                                                ; preds = %1
  ret void, !dbg !13
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @svp_simple_560_001_isr_1(i8* %0) #0 !dbg !14 {
  %2 = load i32, i32* @data, align 4, !dbg !15, !tbaa !16
  %3 = add nsw i32 %2, 1, !dbg !20
  store i32 %3, i32* @data, align 4, !dbg !21, !tbaa !16
  ret void, !dbg !22
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @svp_simple_560_001_main() #0 !dbg !23 {
  %1 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !24
  %2 = icmp sle i32 0, %1, !dbg !25
  br i1 %2, label %3, label %5, !dbg !26

3:                                                ; preds = %0
  %4 = icmp slt i32 %1, 10, !dbg !27
  br label %5

5:                                                ; preds = %3, %0
  %6 = phi i1 [ false, %0 ], [ %4, %3 ]
  %7 = zext i1 %6 to i32, !dbg !26
  br i1 %6, label %assume_abort_if_not.exit, label %8, !dbg !28

8:                                                ; preds = %5
  call void @abort() #5, !dbg !30
  unreachable, !dbg !30

assume_abort_if_not.exit:                         ; preds = %5
  %9 = load i32, i32* @data, align 4, !dbg !31, !tbaa !16
  %10 = add nsw i32 %9, 1, !dbg !32
  store i32 %10, i32* @data, align 4, !dbg !33, !tbaa !16
  ret i32 0, !dbg !34
}

declare i32 @__VERIFIER_nondet_int(...) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_560_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "assume_abort_if_not", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_560_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 4, column: 7, scope: !7)
!11 = !DILocation(line: 4, column: 6, scope: !7)
!12 = !DILocation(line: 4, column: 14, scope: !7)
!13 = !DILocation(line: 5, column: 1, scope: !7)
!14 = distinct !DISubprogram(name: "svp_simple_560_001_isr_1", scope: !8, file: !8, line: 11, type: !9, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!15 = !DILocation(line: 13, column: 9, scope: !14)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C/C++ TBAA"}
!20 = !DILocation(line: 13, column: 13, scope: !14)
!21 = !DILocation(line: 14, column: 7, scope: !14)
!22 = !DILocation(line: 17, column: 1, scope: !14)
!23 = distinct !DISubprogram(name: "svp_simple_560_001_main", scope: !8, file: !8, line: 19, type: !9, scopeLine: 19, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!24 = !DILocation(line: 21, column: 11, scope: !23)
!25 = !DILocation(line: 22, column: 25, scope: !23)
!26 = !DILocation(line: 22, column: 30, scope: !23)
!27 = !DILocation(line: 22, column: 35, scope: !23)
!28 = !DILocation(line: 4, column: 6, scope: !7, inlinedAt: !29)
!29 = distinct !DILocation(line: 22, column: 3, scope: !23)
!30 = !DILocation(line: 4, column: 14, scope: !7, inlinedAt: !29)
!31 = !DILocation(line: 23, column: 11, scope: !23)
!32 = !DILocation(line: 23, column: 15, scope: !23)
!33 = !DILocation(line: 24, column: 7, scope: !23)
!34 = !DILocation(line: 27, column: 3, scope: !23)
