; ModuleID = 'svp_simple_611_001-opt.bc'
source_filename = "./svp_simple_611_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@glob1 = global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !12 {
  %2 = icmp ne i32 %0, 0, !dbg !13
  br i1 %2, label %6, label %3, !dbg !14

3:                                                ; preds = %1
  br label %4, !dbg !15

4:                                                ; preds = %3
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !16
  call void @abort() #4, !dbg !18
  unreachable, !dbg !18

6:                                                ; preds = %1
  ret void, !dbg !19
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @svp_simple_611_001_isr_1(i8* %0) #0 !dbg !20 {
  store i32 5, i32* @glob1, align 4, !dbg !21, !tbaa !22
  store i32 0, i32* @glob1, align 4, !dbg !26, !tbaa !22
  ret void, !dbg !27
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_611_001_main() #0 !dbg !28 {
  %1 = load i32, i32* @glob1, align 4, !dbg !29, !tbaa !22
  %2 = icmp eq i32 %1, 5, !dbg !30
  %3 = xor i1 %2, true, !dbg !31
  %4 = zext i1 %3 to i32, !dbg !31
  br i1 %3, label %__VERIFIER_assert.exit, label %5, !dbg !32

5:                                                ; preds = %0
  %6 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !34
  call void @abort() #5, !dbg !36
  unreachable, !dbg !36

__VERIFIER_assert.exit:                           ; preds = %0
  ret i32 0, !dbg !37
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_611_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_611_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 3, column: 40, scope: !12)
!14 = !DILocation(line: 3, column: 39, scope: !12)
!15 = !DILocation(line: 3, column: 48, scope: !12)
!16 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !17)
!17 = distinct !DILocation(line: 3, column: 58, scope: !12)
!18 = !DILocation(line: 3, column: 72, scope: !12)
!19 = !DILocation(line: 3, column: 84, scope: !12)
!20 = distinct !DISubprogram(name: "svp_simple_611_001_isr_1", scope: !8, file: !8, line: 9, type: !9, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 11, column: 9, scope: !20)
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !24, i64 0}
!24 = !{!"omnipotent char", !25, i64 0}
!25 = !{!"Simple C/C++ TBAA"}
!26 = !DILocation(line: 15, column: 9, scope: !20)
!27 = !DILocation(line: 18, column: 1, scope: !20)
!28 = distinct !DISubprogram(name: "svp_simple_611_001_main", scope: !8, file: !8, line: 20, type: !9, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 24, column: 23, scope: !28)
!30 = !DILocation(line: 24, column: 29, scope: !28)
!31 = !DILocation(line: 24, column: 21, scope: !28)
!32 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !33)
!33 = distinct !DILocation(line: 24, column: 3, scope: !28)
!34 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !35)
!35 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !33)
!36 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !33)
!37 = !DILocation(line: 27, column: 3, scope: !28)
